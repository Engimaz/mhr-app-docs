# 部署前准备

- 需要一个LoadBalancer

- 需要动态制备存储卷

# 核心helm文件

## 目录结构

```textile
├── openvpn
│   ├── Chart.yaml
│   ├── create-user-key.sh
│   ├── mhr.ovpn
│   ├── README.md
│   ├── rm-client-key.sh
│   ├── templates
│   │   ├── certs-pvc.yaml
│   │   ├── config-ccd.yaml
│   │   ├── config-openvpn.yaml
│   │   ├── _helpers.tpl
│   │   ├── NOTES.txt
│   │   ├── openvpn-deployment.yaml
│   │   └── openvpn-service.yaml
│   └── values.yaml
```

1. values.yaml

```yaml
# 设置集群中OpenVPN的副本数为1
replicaCount: 1

updateStrategy: {}
  # type: RollingUpdate # 更新时逐步替换Pod
  # rollingUpdate:
  #   maxSurge: 1 在更新过程中，允许超出期望副本数的最大Pod数量
  #   maxUnavailable: 0 在更新过程中，允许不可用的Pod数量。

# 指定从私有镜像仓库拉取镜像时使用的Secret名称
imagePullSecretName: my-aliyun 

image:
  repository: registry.cn-hangzhou.aliyuncs.com/mhr/openvpn-docker # 镜像仓库地址
  tag: 1.1.0 # 镜像的标签版本。
  pullPolicy: IfNotPresent # 镜像拉取策略，如果本地已存在镜像则不拉取
service:
  type: LoadBalancer # 服务类型为LoadBalancer，表示使用云服务商的负载均衡器。
  externalPort: 443 # 外部访问端口为443。
  internalPort: 443 # 内部服务端口为443。
  # hostPort: 443
  externalIPs: []
  nodePort: 32085
  # clusterIP: None 注释掉的ClusterIP配置，表示不使用ClusterIP。
  # LoadBalancerSourceRanges: 0.0.0.0/0 注释掉的负载均衡器源IP范围。
  # loadBalancerIP: 10.0.0.1 # 注释掉的负载均衡器IP地址。

  ## Here annotations can be added to the openvpn service
  # annotations:
  #   external-dns.alpha.kubernetes.io/hostname: vpn.example.com
  annotations: {}
#    service.beta.kubernetes.io/aws-load-balancer-type: nlb 注释掉的AWS负载均衡器类型注解。
## Here annotations can be added to the openvpn pod
# podAnnotations:
#   backup.ark.heptio.com/backup-volumes: certs # 注释掉的备份卷注解
podAnnotations: {}

# 启用IPv4转发。
ipForwardInitContainer: true

resources:
  limits:
    cpu: 400m # CPU限制为400毫核。
    memory: 200Mi # 内存限制为200MiB。
  requests:
    cpu: 350m # CPU请求为350毫核。
    memory: 175Mi #内存请求为175MiB。

readinessProbe:
  initialDelaySeconds: 5 # 容器启动后5秒开始探测。
  periodSeconds: 5 #每5秒探测一次。
  successThreshold: 2 # 连续2次探测成功则认为Pod就绪。

persistence:
  enabled: true # 启用持久化存储。
  storageClass: "managed-nfs-storage" # 持久卷的存储类
  accessMode: ReadWriteOnce # 访问模式为ReadWriteOnce。
  size: 2G # 持久卷的大小为2GB。

openvpn:
  # OpenVPN客户端分配的网络地址。 隧道地址
  OVPN_NETWORK: 10.240.0.0
  # OpenVPN客户端分配的子网掩码。
  OVPN_SUBNET: 255.255.0.0
  # OpenVPN使用的协议为TCP。
  OVPN_PROTO: tcp
  # Kubernetes Pod网络地址。
  OVPN_K8S_POD_NETWORK: "10.244.0.0"
  #Kubernetes Pod子网掩码。
  OVPN_K8S_POD_SUBNET: "255.255.0.0"
  # Kubernetes服务网络地址。
  OVPN_K8S_SVC_NETWORK: "10.96.0.0"
  # Kubernetes服务子网掩码。
  OVPN_K8S_SVC_SUBNET: "255.240.0.0"
  # 启用默认路由
  DEFAULT_ROUTE_ENABLED: true 
  # 推送dhcp-option DOMAIN配置。
  dhcpOptionDomain: true
  push:
    dnsServers:
      # - 114.114.114.114
      # - 8.8.8.8
      # - 8.8.4.4
  # 将所有客户端流量通过VPN重定向。
  redirectGateway: true
  # 不使用证书吊销列表。
  useCrl: false
  # 生成/使用ta.key文件以增强安全性
  taKey: yes
  #设置发送/接收缓冲区大小。
  OVPN_SNDBUF: 0
  OVPN_RCVBUF: 0
  # 设置加密算法为AES-256-CBC。 目前版本是2.4.4
  cipher: AES-256-CBC
  # 设置HMAC签名算法为SHA512。 
  auth: SHA512
  #使用TLS验证服务器身份。
  remoteCertTls: true
  #无限重试连接服务器。
  resolvretry: infinite
  #设置密钥方向
  keyDirection: 1
  #设置日志详细级别为3
  verb: 3
  # 注释掉的服务器配置文件追加内容。
  # serverConf: |
  #  max-clients 100
  #  client-to-client

  # 注释掉的客户端配置文件追加内容。以下内容需要客户端是 linux才有用 如果是macos 在dns解析失败时 手动添加 dns服务器与搜索域
  # clientConf: |
  #  script-security 2
  #  up /etc/openvpn/update-systemd-resolved
  #  up-restart
  #  down /etc/openvpn/update-systemd-resolved
  #  down-pre

  # Istio支持配置。
  istio:
    enabled: false
    proxy:
      port: 15001
  # 额外的iptables规则。
  iptablesExtra: 
    #允许已建立和相关连接通过。
  - -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
  # 允许新连接到OpenVPN网络。
  - -A FORWARD -m conntrack --ctstate NEW -d 10.240.0.0/255.255.0.0 -j ACCEPT
  # - -A FORWARD -j REJECT # 注释掉的拒绝所有其他连接的规则。

  # 客户端配置文件目录（CCD）支持。
  ccd:
    enabled: false
    config: {}
    # johndoe: "ifconfig-push 10.240.100.10 10.240.100.11" # 注释掉的客户端特定IP配置。
    # janedoe: "ifconfig-push 10.240.100.20 10.240.100.21"
# 选择带有openvpn=true标签的节点。
nodeSelector: {
  openvpn: 'true'
}
tolerations: []
```
