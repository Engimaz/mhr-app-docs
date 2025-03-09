# k8s常用命令

## 删除Released状态的pv

```shell
kubectl get pv -o jsonpath='{range .items[?(@.status.phase=="Released")]}{.metadata.name}{"\n"}{end}' | xargs -I {} kubectl delete pv {}
```

## 创建私钥

```shell
kubectl create secret -n <ns> docker-registry my-aliyun --docker-server=registry.cn-hangzhou.aliyuncs.com --docker-username=马海荣 --docker-password=mmmm0827
```

## 节点加上标签

```shell
kubectl label nodes k8s-master openvpn=true
```

## 查看节点资源

```shell
kubectl describe node k8s-node-4
```
