# 第三章 安装K8S

## 安装前配置

### 设置主机名

```shell
hostnamectl set-hostname <hostname>
```

### 配置dns

```shell
cat >> /etc/hosts << EOF
192.168.3.100 k8s-master
192.168.3.101 k8s-node-1
192.168.3.102 k8s-node-2
192.168.3.103 k8s-node-3
192.168.3.104 k8s-node-4
EOF
```

### 将桥接的IPv4流量传递到iptables的链

```shell
cat > /etc/sysctl.d/k8s.conf << EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
```

### 使得配置生效

```shell
sysctl --system 
```

### 时间同步

```shell
yum install ntpdate -y # 安装utpdate工具
ntpdate time.windows.com # 设置系统时间与网络时间同步
hwclock --systohc # 将系统时间写入硬件时间
timedatectl set-timezone Asia/Shanghai # 设置系统时区为上海
```

### 禁用swap

```shell
swapoff -a  # 临时
sed -ri 's/.*swap.*/#&/' /etc/fstab    # 永久
```

## 部署k8s集群

### 配置安装源

```shell
cp /etc/yum.repos.d/kubernetes.repo /etc/yum.repos.d/kubernetes.repo.bak
```

### 写入镜像源

```shell
cat > /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0

gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
```

### 安装 kubeadm、kubelet、kubectl

```shell
yum install -y kubelet-1.23.6 kubeadm-1.23.6 kubectl-1.23.6
```

### master启动k8s

```shell
kubeadm init \
      --apiserver-advertise-address=192.168.3.100 \
      --image-repository registry.aliyuncs.com/google_containers \
      --kubernetes-version v1.23.6 \
      --service-cidr=10.96.0.0/12 \
      --pod-network-cidr=10.244.0.0/16
```

#### 1. 查看启动报错日志

```shell
journalctl -xefu kubelet
```

### 启动成功随后执行启动成功建议

```shell
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

## master配置开机自启动

```shell
systemctl enable kubelet
systemctl start kubelet
```

### token 过期创建token

```shell
kubeadm token create
```

### 没有过期就查看token

```shell
kubeadm token list
```

### 生成token-hash

```shell
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'
```

### 启动成功 其他节点执行该命令加入集群

```shell
kubeadm join 192.168.3.100:6443 --token scnixz.s0qfauxs6jabp0vw \
 --discovery-token-ca-cert-hash sha256:203c9f0abb5a9bf1807fb72a6968c9f35f1059aa3114ab592030abe6a688ad70
```

### 显示加入节点命令

```yml
kubeadm token create --print-join-command
```



### 在任意节点使用kubectl

1. 将 master 节点中 /etc/kubernetes/admin.conf 拷贝到需要运行的服务器的 /etc/kubernetes 目录中

```shell
scp /etc/kubernetes/admin.conf root@k8s-node-1:/etc/kubernetes
```

2. 在对应的服务器上配置环境变量

```shell
 echo "export KUBECONFIG=/etc/kubernetes/admin.conf" >> ~/.bash_profile
 source ~/.bash_profile
```

### 重置k8s

```shell
kubeadm reset
```

## 重新生成kubectl的配置文件

```shell
kubeadm init phase kubelet-start
kubeadm init phase kubeconfig all
```

## 重新生成证书文件

```shell
kubeadm init phase certs all
```
