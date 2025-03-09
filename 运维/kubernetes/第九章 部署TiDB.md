# 第九章 部署TiDB

## 安装TiDB-Operate

```shell
wget http://charts.pingcap.org/tidb-operator-v1.6.1.tgz
```

## 解压然后安装

```shell
tar -zxvf tidb-operator-v1.6.1.tgz
helm install tidb-operator -n tidb .
```

## 安装crd

```shell
wget https://raw.githubusercontent.com/pingcap/tidb-operator/v1.6.1/manifests/crd.yaml
kubectl create -f ./crd.yaml
```

## 安装集群

> 可提前下载镜像

```docker
docker login --username=马海荣 registry.cn-hangzhou.aliyuncs.com
docker pull registry.cn-hangzhou.aliyuncs.com/mhr/pd:v8.5.0
docker pull registry.cn-hangzhou.aliyuncs.com/mhr/tikv:v8.5.0
docker pull registry.cn-hangzhou.aliyuncs.com/mhr/tidb:v8.5.0
docker pull registry.cn-hangzhou.aliyuncs.com/mhr/alpine:3.6
```

## 使用客户端修改密码

```shell
yum install mysql -y
mysql -h basic-tidb -P 4000 -u root -p
```



## 设置root密码

```shell
ALTER USER 'root'@'%' IDENTIFIED BY '123456';
```
