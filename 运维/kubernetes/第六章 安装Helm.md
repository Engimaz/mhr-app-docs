# 第六章 安装Helm

## 下载helm并解压

```shell
tar -zxvf helm-v3.17.0-linux-amd64.tar.gz 
```

## 移动可执行文件到bin

```shell
cp helm /usr/local/bin/helm
```

## 版本检验

```shell
helm version
```

> version.BuildInfo{Version:"v3.17.0", GitCommit:"301108edc7ac2a8ba79e4ebf5701b0b6ce6a31e4", GitTreeState:"clean", GoVersion:"go1.23.4"}
