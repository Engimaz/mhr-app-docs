# 第四章 部署CNI网络

## 下载calico网络配置 [calico.yml](./file/calico.yml)

```shell
 curl https://docs.projectcalico.org/manifests/calico.yaml -O
```

## 配置修改配置

>  修改网络配置 `CALICO_IPV4POOL_CIDR` 与启动master时的`pod-network-cidr` 一致

#### 下载文件所需镜像

```shell
grep image calico.yaml 
```

#### 如有需要可替换docker 下载地址切换为 阿里云私服 地址

```
   docker.io/calico -> registry.cn-hangzhou.aliyuncs.com/mhr
```

## 创建私钥

```shell
kubectl create secret -n kube-system docker-registry my-aliyun --docker-server=registry.cn-hangzhou.aliyuncs.com --docker-username=马海荣 --docker-password=xxxx
```

## 构建网络

```shell
kubectl apply -f calico.yaml
```

## 查看网络信息

```shell
   kubectl get po -n kube-system
```
