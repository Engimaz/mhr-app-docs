# 第十四章 部署ELK

## 部署ES

```yml
---
apiVersion: v1
kind: Service
metadata:
  name: elasticsearch-logging
  namespace: kube-logging
  labels:
    k8s-app: elasticsearch-logging
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: Reconcile
    kubernetes.io/name: "Elasticsearch"
spec:
  ports:
    - port: 9200
      protocol: TCP
      targetPort: db
  selector:
    k8s-app: elasticsearch-logging
---
# RBAC authn and authz
apiVersion: v1
kind: ServiceAccount
metadata:
  name: elasticsearch-logging
  namespace: kube-logging
  labels:
    k8s-app: elasticsearch-logging
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: Reconcile
---
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: elasticsearch-logging
  labels:
    k8s-app: elasticsearch-logging
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: Reconcile
rules:
  - apiGroups:
      - ""
    resources:
      - "services"
      - "namespaces"
      - "endpoints"
    verbs:
      - "get"
---
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: kube-logging
  name: elasticsearch-logging
  labels:
    k8s-app: elasticsearch-logging
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: Reconcile
subjects:
  - kind: ServiceAccount
    name: elasticsearch-logging
    namespace: kube-logging
    apiGroup: ""
roleRef:
  kind: ClusterRole
  name: elasticsearch-logging
  apiGroup: ""
---
# Elasticsearch deployment itself
apiVersion: apps/v1
kind: StatefulSet #使用statefulset创建Pod
metadata:
  name: elasticsearch-logging #pod名称,使用statefulSet创建的Pod是有序号有顺序的
  namespace: kube-logging #命名空间
  labels:
    k8s-app: elasticsearch-logging
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: Reconcile
    srv: srv-elasticsearch
spec:
  serviceName: elasticsearch-logging #与svc相关联，这可以确保使用以下DNS地址访问Statefulset中的每个pod (es-cluster-[0,1,2].elasticsearch.elk.svc.cluster.local)
  replicas: 1 #副本数量,单节点
  selector:
    matchLabels:
      k8s-app: elasticsearch-logging #和pod template配置的labels相匹配
  template:
    metadata:
      labels:
        k8s-app: elasticsearch-logging
        kubernetes.io/cluster-service: "true"
    spec:
      serviceAccountName: elasticsearch-logging
      imagePullSecrets: #设置镜像的下载秘钥(例如使用私库下载镜像时,访问私库需要秘钥,就在该位置设置)
        - name: my-aliyun #设置指定秘钥名
      containers:
        - image: registry.cn-hangzhou.aliyuncs.com/mhr/elasticsearch:7.6.2
          name: elasticsearch-logging
          resources:
            # need more cpu upon initialization, therefore burstable class
            limits:
              cpu: 1000m
              memory: 2Gi
            requests:
              cpu: 100m
              memory: 500Mi
          ports:
            - containerPort: 9200
              name: db
              protocol: TCP
            - containerPort: 9300
              name: transport
              protocol: TCP
          volumeMounts:
            - name: elasticsearch-logging
              mountPath: /usr/share/elasticsearch/data/ #挂载点
          env:
            - name: "NAMESPACE"
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
            - name: "discovery.type" #定义单节点类型
              value: "single-node"
            - name: ES_JAVA_OPTS #设置Java的内存参数，可以适当进行加大调整
              value: "-Xms512m -Xmx2g"
      volumes:
        - name: elasticsearch-logging
          hostPath:
            path: /data/es/
      # nodeSelector: #如果需要匹配落盘节点可以添加 nodeSelect
      #   es: data
      tolerations:
        - effect: NoSchedule
          operator: Exists
      # Elasticsearch requires vm.max_map_count to be at least 262144.
      # If your OS already sets up this number to a higher value, feel free
      # to remove this init container.
      initContainers: #容器初始化前的操作
        - name: elasticsearch-logging-init
          image: registry.cn-hangzhou.aliyuncs.com/mhr/alpine:3.6
          command: ["/sbin/sysctl", "-w", "vm.max_map_count=262144"] #添加mmap计数限制，太低可能造成内存不足的错误
          securityContext: #仅应用到指定的容器上，并且不会影响Volume
            privileged: true #运行特权容器
        - name: increase-fd-ulimit
          image: registry.cn-hangzhou.aliyuncs.com/mhr/busybox:1.29
          imagePullPolicy: IfNotPresent
          command: ["sh", "-c", "ulimit -n 65536"] #修改文件描述符最大数量
          securityContext:
            privileged: true
        - name: elasticsearch-volume-init #es数据落盘初始化，加上777权限
          image: registry.cn-hangzhou.aliyuncs.com/mhr/alpine:3.6
          command:
            - chmod
            - -R
            - "777"
            - /usr/share/elasticsearch/data/
          volumeMounts:
            - name: elasticsearch-logging
              mountPath: /usr/share/elasticsearch/data/

```

## 部署 filebeat

```yml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: filebeat-config
  namespace: kube-logging
  labels:
    k8s-app: filebeat
data:
  filebeat.yml: |-
    filebeat.inputs: 
    - type: container 
      enable: true
      paths:
        - /var/log/containers/*.log #这里是filebeat采集挂载到pod中的日志目录 
      processors: 
        - add_kubernetes_metadata: #添加k8s的字段用于后续的数据清洗 
            host: ${NODE_NAME}
            matchers: 
            - logs_path: 
                logs_path: "/var/log/containers/" 
    #output.kafka:  #如果日志量较大，es中的日志有延迟，可以选择在filebeat和logstash中间加入kafka 
    #  hosts: ["kafka-log-01:9092", "kafka-log-02:9092", "kafka-log-03:9092"] 
    # topic: 'topic-test-log'
    #  version: 2.0.0
    output.logstash: #因为还需要部署logstash进行数据的清洗，因此filebeat是把数据推到logstash中 
      hosts: ["logstash:5044"]
      enabled: true
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: filebeat
  namespace: kube-logging
  labels:
    k8s-app: filebeat
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: filebeat
  labels:
    k8s-app: filebeat
rules:
  - apiGroups: [""] # "" indicates the core API group
    resources:
      - namespaces
      - pods
    verbs: ["get", "watch", "list"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: filebeat
subjects:
  - kind: ServiceAccount
    name: filebeat
    namespace: kube-logging
roleRef:
  kind: ClusterRole
  name: filebeat
  apiGroup: rbac.authorization.k8s.io
---
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: filebeat
  namespace: kube-logging
  labels:
    k8s-app: filebeat
spec:
  selector:
    matchLabels:
      k8s-app: filebeat
  template:
    metadata:
      labels:
        k8s-app: filebeat
    spec:
      serviceAccountName: filebeat
      terminationGracePeriodSeconds: 30
      imagePullSecrets: #设置镜像的下载秘钥(例如使用私库下载镜像时,访问私库需要秘钥,就在该位置设置)
        - name: my-aliyun #设置指定秘钥名
      containers:
        - name: filebeat
          image: registry.cn-hangzhou.aliyuncs.com/mhr/filebeat:7.6.2 #该镜像支持arm64和amd64两种架构
          args: ["-c", "/etc/filebeat.yml", "-e", "-httpprof", "0.0.0.0:6060"]
          #ports:
          #  - containerPort: 6060
          #    hostPort: 6068
          env:
            - name: NODE_NAME
              valueFrom:
                fieldRef:
                  fieldPath: spec.nodeName
            - name: ELASTICSEARCH_HOST
              value: elasticsearch-logging
            - name: ELASTICSEARCH_PORT
              value: "9200"
          securityContext:
            runAsUser: 0
            # If using Red Hat OpenShift uncomment this:
            #privileged: true
          resources:
            limits:
              memory: 1000Mi
              cpu: 1000m
            requests:
              memory: 100Mi
              cpu: 100m
          volumeMounts:
            - name: config #挂载的是filebeat的配置文件
              mountPath: /etc/filebeat.yml
              readOnly: true
              subPath: filebeat.yml
            - name: data #持久化filebeat数据到宿主机上
              mountPath: /usr/share/filebeat/data
            - name: varlibdockercontainers #这里主要是把宿主机上的源日志目录挂载到filebeat容器中,如果没有修改docker或者containerd的runtime进行了标准的日志落盘路径，可以把mountPath改为/var/lib
              mountPath: /var/lib
              readOnly: true
            - name: varlog #这里主要是把宿主机上/var/log/pods和/var/log/containers的软链接挂载到filebeat容器中
              mountPath: /var/log/
              readOnly: true
            - name: timezone
              mountPath: /etc/localtime
      volumes:
        - name: config
          configMap:
            defaultMode: 0600
            name: filebeat-config
        - name: varlibdockercontainers
          hostPath: #如果没有修改docker或者containerd的runtime进行了标准的日志落盘路径，可以把path改为/var/lib
            path: /var/lib
        - name: varlog
          hostPath:
            path: /var/log/
        # data folder stores a registry of read status for all files, so we don't send everything again on a Filebeat pod restart
        - name: inputs
          configMap:
            defaultMode: 0600
            name: filebeat-inputs
        - name: data
          hostPath:
            path: /data/filebeat-data
            type: DirectoryOrCreate
        - name: timezone
          hostPath:
            path: /etc/localtime
      tolerations: #加入容忍能够调度到每一个节点
        - effect: NoExecute
          key: dedicated
          operator: Equal
          value: gpu
        - effect: NoSchedule
          operator: Exists

```

## 部署logstash

```yml
---
apiVersion: v1
kind: Service
metadata:
  name: logstash
  namespace: kube-logging
spec:
  ports:
    - port: 5044
      targetPort: beats
  selector:
    type: logstash
  clusterIP: None
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: logstash
  namespace: kube-logging
spec:
  selector:
    matchLabels:
      type: logstash
  template:
    metadata:
      labels:
        type: logstash
        srv: srv-logstash
    spec:
      imagePullSecrets: #设置镜像的下载秘钥(例如使用私库下载镜像时,访问私库需要秘钥,就在该位置设置)
        - name: my-aliyun #设置指定秘钥名
      containers:
        - image: registry.cn-hangzhou.aliyuncs.com/mhr/logstash:7.6.2 #该镜像支持arm64和amd64两种架构
          name: logstash
          ports:
            - containerPort: 5044
              name: beats
          command:
            - logstash
            - "-f"
            - "/etc/logstash_c/logstash.conf"
          env:
            - name: "XPACK_MONITORING_ELASTICSEARCH_HOSTS"
              value: "http://elasticsearch-logging:9200"
          volumeMounts:
            - name: config-volume
              mountPath: /etc/logstash_c/
            - name: config-yml-volume
              mountPath: /usr/share/logstash/config/
            - name: timezone
              mountPath: /etc/localtime
          resources: #logstash一定要加上资源限制，避免对其他业务造成资源抢占影响
            limits:
              cpu: 1000m
              memory: 2048Mi
            requests:
              cpu: 512m
              memory: 512Mi
      volumes:
        - name: config-volume
          configMap:
            name: logstash-conf
            items:
              - key: logstash.conf
                path: logstash.conf
        - name: timezone
          hostPath:
            path: /etc/localtime
        - name: config-yml-volume
          configMap:
            name: logstash-yml
            items:
              - key: logstash.yml
                path: logstash.yml

---
apiVersion: v1
kind: ConfigMap
metadata:
  name: logstash-conf
  namespace: kube-logging
  labels:
    type: logstash
data:
  logstash.conf: |-
    input {
      beats { 
        port => 5044 
      } 
    } 
    filter {
      # 处理 ingress 日志 
      if [kubernetes][container][name] == "nginx-ingress-controller" {
        json {
          source => "message" 
          target => "ingress_log" 
        }
        if [ingress_log][requesttime] { 
          mutate { 
            convert => ["[ingress_log][requesttime]", "float"] 
          }
        }
        if [ingress_log][upstremtime] { 
          mutate { 
            convert => ["[ingress_log][upstremtime]", "float"] 
          }
        } 
        if [ingress_log][status] { 
          mutate { 
            convert => ["[ingress_log][status]", "float"] 
          }
        }
        if  [ingress_log][httphost] and [ingress_log][uri] {
          mutate { 
            add_field => {"[ingress_log][entry]" => "%{[ingress_log][httphost]}%{[ingress_log][uri]}"} 
          } 
          mutate { 
            split => ["[ingress_log][entry]","/"] 
          } 
          if [ingress_log][entry][1] { 
            mutate { 
              add_field => {"[ingress_log][entrypoint]" => "%{[ingress_log][entry][0]}/%{[ingress_log][entry][1]}"} 
              remove_field => "[ingress_log][entry]" 
            }
          } else { 
            mutate { 
              add_field => {"[ingress_log][entrypoint]" => "%{[ingress_log][entry][0]}/"} 
              remove_field => "[ingress_log][entry]" 
            }
          }
        }
      }
      # 处理以srv进行开头的业务服务日志 
      if [kubernetes][container][name] =~ /^srv*/ { 
        json { 
          source => "message" 
          target => "tmp" 
        } 
        if [kubernetes][namespace] == "kube-logging" { 
          drop{} 
        } 
        if [tmp][level] { 
          mutate{ 
            add_field => {"[applog][level]" => "%{[tmp][level]}"} 
          } 
          if [applog][level] == "debug"{ 
            drop{} 
          } 
        } 
        if [tmp][msg] { 
          mutate { 
            add_field => {"[applog][msg]" => "%{[tmp][msg]}"} 
          } 
        } 
        if [tmp][func] { 
          mutate { 
            add_field => {"[applog][func]" => "%{[tmp][func]}"} 
          } 
        } 
        if [tmp][cost]{ 
          if "ms" in [tmp][cost] { 
            mutate { 
              split => ["[tmp][cost]","m"] 
              add_field => {"[applog][cost]" => "%{[tmp][cost][0]}"} 
              convert => ["[applog][cost]", "float"] 
            } 
          } else { 
            mutate { 
              add_field => {"[applog][cost]" => "%{[tmp][cost]}"} 
            }
          }
        }
        if [tmp][method] { 
          mutate { 
            add_field => {"[applog][method]" => "%{[tmp][method]}"} 
          }
        }
        if [tmp][request_url] { 
          mutate { 
            add_field => {"[applog][request_url]" => "%{[tmp][request_url]}"} 
          } 
        }
        if [tmp][meta._id] { 
          mutate { 
            add_field => {"[applog][traceId]" => "%{[tmp][meta._id]}"} 
          } 
        } 
        if [tmp][project] { 
          mutate { 
            add_field => {"[applog][project]" => "%{[tmp][project]}"} 
          }
        }
        if [tmp][time] { 
          mutate { 
            add_field => {"[applog][time]" => "%{[tmp][time]}"} 
          }
        }
        if [tmp][status] { 
          mutate { 
            add_field => {"[applog][status]" => "%{[tmp][status]}"} 
            convert => ["[applog][status]", "float"] 
          }
        }
      }
      mutate { 
        rename => ["kubernetes", "k8s"] 
        remove_field => "beat" 
        remove_field => "tmp" 
        remove_field => "[k8s][labels][app]" 
      }
    }
    output { 
      elasticsearch { 
        hosts => ["http://elasticsearch-logging:9200"] 
        codec => json 
        index => "logstash-%{+YYYY.MM.dd}" #索引名称以logstash+日志进行每日新建 
      }
    }
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: logstash-yml
  namespace: kube-logging
  labels:
    type: logstash
data:
  logstash.yml: |-
    http.host: "0.0.0.0" 
    xpack.monitoring.elasticsearch.hosts: http://elasticsearch-logging:9200

```

## 部署kibana

```yml

```


