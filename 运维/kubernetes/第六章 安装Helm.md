# 第六章 安装Helm

## 下载helm

```yaml
wget https://get.helm.sh/helm-v3.17.0-linux-amd64.tar.gz
```

## 解压helm 并移动到指定位置

```shell
tar -zxvf helm-v3.17.0-linux-amd64.tar.gz 
```

```shell
 cp helm /usr/local/bin/helm
```

## 添加镜像地址

```shell
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add aliyun https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts
```

## 搜索仓库

```shell
helm search repo redi
```

## 版本检验

```shell
helm version
```

> version.BuildInfo{Version:"v3.17.0", GitCommit:"301108edc7ac2a8ba79e4ebf5701b0b6ce6a31e4", GitTreeState:"clean", GoVersion:"go1.23.4"}
