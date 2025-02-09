# k8s的包管理器helm

## 1. 下载helm

```yaml
wget https://get.helm.sh/helm-v3.17.0-linux-amd64.tar.gz
```

## 2. 解压helm 并移动到指定位置

```shell
tar -zxvf helm-v3.17.0-linux-amd64.tar.gz 
```

```shell
 cp helm /usr/local/bin/helm
```

## 3.添加镜像地址

```shell
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add aliyun https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts
```

## 4. 搜索仓库

```shell
helm search repo redis
```
