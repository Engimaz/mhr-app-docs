# 第二章 安装docker

## 下载docker依赖工具

```shell
yum install -y yum-utils      device-mapper-persistent-data        lvm2 --skip-broken
```

## 配置docker镜像源

```shell
wget -O /etc/yum.repos.d/docker-ce.repo https://mirrors.huaweicloud.com/docker-ce/linux/centos/docker-ce.repo
```

## 替换软件仓库地址

```shell
sudo sed -i 's+download.docker.com+mirrors.huaweicloud.com/docker-ce+' /etc/yum.repos.d/docker-ce.repo
```

## 更新索引文件

```shell
sudo yum makecache fast
```

## 安装docker

```shell
sudo yum install -y docker-ce 
```

## docker 中配置cgroup

> 在 `/etc/docker/daemon.json` 中加入属性 **exec-opt**

```json
{
  ...
  "registry-mirrors": [
    "https://registry.cn-hangzhou.aliyuncs.com"
  ],
  "exec-opts": [
    "native.cgroupdriver=systemd"
  ]
  ...
}
```

### 查看docker驱动

```shell
   docker info|grep Driver
```

## 添加开机自启动

```shell
systemctl enable docker
systemctl start docker
```

## 检查版本

```shell
docker --version
```

> Docker version 26.1.4, build 5650f9b

# 
