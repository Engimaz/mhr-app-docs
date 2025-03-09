# 第八章 部署Minio

## 添加下载源

```shell
helm repo add bitnami https://charts.bitnami.com/bitnami
```

```shell
https://charts.bitnami.com/bitnami/minio-15.0.6.tgz
```

## 解压文件

```shell
 tar -zxvf minio-15.0.6.tgz 
```

## 执行命令

```shell
helm install minio -n minio .
```
