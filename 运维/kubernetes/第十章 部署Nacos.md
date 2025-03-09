# 第十章 部署Nacos

## 写入配置文件

```yml
---
apiVersion: v1
kind: Service
metadata:
  name: nacos-headless
  namespace: nacos
  labels:
    app: nacos-headless
spec:
  type: ClusterIP
  ports:
    - port: 8848
      name: server
      targetPort: 8848
    - port: 9848
      name: client-rpc
      targetPort: 9848
    - port: 9849
      name: raft-rpc
      targetPort: 9849
    ## 兼容1.4.x版本的选举端口
    - port: 7848
      name: old-raft-rpc
      targetPort: 7848
  selector:
    app: nacos
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: nacos-cm
  namespace: nacos
data:
  mysql.host: "basic-tidb.tidb.svc.cluster.local"
  mysql.db.name: "nacos-config"
  mysql.port: "4000"
  mysql.user: "root"
  mysql.password: "123456"
  mysql.db.param: ""


---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: nacos
  namespace: nacos
spec:
  serviceName: nacos-headless
  replicas: 2
  template:
    metadata:
      labels:
        app: nacos
      annotations:
        pod.alpha.kubernetes.io/initialized: "true"
    spec:
      # affinity:
      #   podAntiAffinity:
      #     requiredDuringSchedulingIgnoredDuringExecution:
      #       - labelSelector:
      #           matchExpressions:
      #             - key: "app"
      #               operator: In
      #               values:
      #                 - nacos
      #         topologyKey: "kubernetes.io/hostname"
      imagePullSecrets:
        - name: my-aliyun
      containers:
        - name: nacos
          imagePullPolicy: Always
          image: registry.cn-hangzhou.aliyuncs.com/mhr/nacos-server:v2.3.2
          resources:
            requests:
              memory: "2Gi"
              cpu: "500m"
          ports:
            - containerPort: 8848
              name: client
            - containerPort: 9848
              name: client-rpc
            - containerPort: 9849
              name: raft-rpc
            - containerPort: 7848
              name: old-raft-rpc
          env:
            - name: NACOS_REPLICAS
              value: "3"
            - name: MYSQL_SERVICE_HOST
              valueFrom:
                configMapKeyRef:
                  name: nacos-cm
                  key: mysql.host
            - name: MYSQL_SERVICE_DB_NAME
              valueFrom:
                configMapKeyRef:
                  name: nacos-cm
                  key: mysql.db.name
            - name: MYSQL_SERVICE_PORT
              valueFrom:
                configMapKeyRef:
                  name: nacos-cm
                  key: mysql.port
            - name: MYSQL_SERVICE_USER
              valueFrom:
                configMapKeyRef:
                  name: nacos-cm
                  key: mysql.user
            - name: MYSQL_SERVICE_PASSWORD
              valueFrom:
                configMapKeyRef:
                  name: nacos-cm
                  key: mysql.password
            - name: SPRING_DATASOURCE_PLATFORM
              value: "mysql"
            - name: NACOS_SERVER_PORT
              value: "8848"
            - name: NACOS_APPLICATION_PORT
              value: "8848"
            - name: SERVER_MODE
              value: "naming"
            - name: NACOS_CLIENT_PORT
              value: "9848"
            - name: NACOS_HTTP_PROTOCOL
              value: "HTTP_1.1"
            - name: PREFER_HOST_MODE
              value: "hostname"
            - name: NACOS_SERVERS
              value: "nacos-0.nacos-headless.nacos.svc.cluster.local:8848 nacos-1.nacos-headless.nacos.svc.cluster.local:8848"
            - name: NACOS_AUTH_ENABLE
              value: "true"
            - name: NACOS_AUTH_IDENTITY_KEY
              value: nacos
            - name: NACOS_AUTH_IDENTITY_VALUE
              value: nacos
            - name: NACOS_AUTH_SYSTEM_TYPE
              value: nacos
            - name: NACOS_AUTH_TOKEN_EXPIRE_SECONDS
              value: "18000"  # Token 过期时间，默认 18000 秒（5 小时）
            - name: NACOS_AUTH_TOKEN
              value: SecretKey012345678901234567890123456789012345678901234567890123456789
            - name: NACOS_AUTH_CACHE_ENABLE
              value: "true"  # 是否启用鉴权缓存  # 自定义 Token
  selector:
    matchLabels:
      app: nacos


```

## 执行安装命令

```yml
kubectl create ns nacos
kubectl apply -f nacos.yaml 
```


