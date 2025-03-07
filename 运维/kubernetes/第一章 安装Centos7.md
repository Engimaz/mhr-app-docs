# 第一章 安装Centos7

## 规划

| 节点名称       | 网络            | 磁盘   | 配置   |
|:----------:|:-------------:|:----:|:----:|
| k8s-master | 192.168.3.100 | 100G | 2C4G |
| k8s-node-1 | 192.168.3.101 | 100G | 2C4G |
| k8s-node-2 | 192.168.3.102 | 100G | 2C4G |
| k8s-node-3 | 192.168.3.103 | 100G | 2C4G |
| k8s-node-4 | 192.168.3.104 | 100G | 2C4G |

## 配置yum环境

### 备份环境

```shell
cp -a /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
```

### 使用华为云镜像地址

```shell
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.huaweicloud.com/repository/conf/CentOS-7-anon.repo
```

### 清除原有缓存

```shell
yum clean all
```

### 刷新缓存

```shell
yum makecache
```

## 检查ssh环境是否安装

```shell
rpm -qa|grep -E "openssh"
```

> 出现以下输出代表则安装

- openssh-7.4p1-11.el7.x86_64
- openssh-server-7.4p1-11.el7.x86_64
- openssh-clients-7.4p1-11.el7.x86_64

> 否则安装

```shell
yum install openssh-server -y
```

### 查看ssh配置

```shell
vim /etc/ssh/sshd_config
```

### 开放防火墙

```shell
sudo firewall-cmd --zone=public --add-port=22/tcp --permanent  
sudo service firewalld restart  
```

### 永久关闭防火墙

```shell
systemctl disable firewalld 
```

### 公钥写入服务器

```shell
 echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHBh2mWGRseRdiyf9abEdyyL8TSP8qeri40NcA7jMXKhKeqPVbOJaScYZJa2MxK9Y5NamZUrpIxQqtZqHCOWohRxdfnxpj4F+OzGTDKCMU7P1vkvygJNYFhB/zcrGf+wH6yXq6PEbbgWx5a9ITVRvPRrZ6IVm6q4Ix+3uxzf71DkufRJ+6yjFn/PhD2YkhM5pH6KtS934H7bJfdDl+Tv/2QY3Xk2c2c/v34YWBHgMPtSjW4EFuF9FqFVcpyrIW+5X6i4gAYlSPNK6kEM4OCUoYcEhF7AvxHWQsxBhN7281QHvGhPJJCQtBSwyzin1zit8JO2ks1VRtXzSBGCSWbeaBoELCfbJ0xNCsrdEZjjB/kw98wSt+9jQs4v7wBYcAVUf891KBk88dtOq+7Ry1db8tj+vm/D2CWtVM9gpJnsJiyRyjBb5dPMtBDGF+nUlFIRTDxuClPNJkn7PjIVnE99o0G3g1YDdL+y2fRILGxWw7cw+YOl6CNVAwU8aiOq+FlJM= enigma@EnigmadeMac-Pro.local" >> /root/.ssh/authorized_keys
```

5. 重启ssh服务

```shell
systemctl restart sshd.service
```

6. 使用桥接模式固定网络
7. 编辑配置文件

```shell
vim /etc/sysconfig/network-scripts/ifcfg-ens33
```

```shell
# 更新
BOOTPROTO="none" 
# 编辑
NM_CONTROLLED="yes"
IPADDR="192.168.3.100"  # 这里就是你设置的固定IP
NETMASK="255.255.255.0" # 上图中IPv4 子网掩码
GATEWAY="192.168.3.1"   # 上图中IPv4 默认网关
DNS1="192.168.3.1"  
```
