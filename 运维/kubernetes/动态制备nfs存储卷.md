# 动态制备nfs存储卷

## 1. 准备文件

- nfs-provisioner-rbac.yaml

```yaml
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: nfs-client-provisioner-runner
rules:
- apiGroups: [""]
  resources: ["persistentvolumes"]
  verbs: ["get", "list", "watch", "create", "delete"]
- apiGroups: [""]
  resources: ["persistentvolumeclaims"]
  verbs: ["get", "list", "watch", "update"]
- apiGroups: [""]
  resources: ["endpoints"]
  verbs: ["get", "list", "watch", "create", "update", "patch"]
- apiGroups: ["storage.k8s.io"]
  resources: ["storageclasses"]
  verbs: ["get", "list", "watch"]
- apiGroups: [""]
  resources: ["events"]
  verbs: ["create", "update", "patch"]
---
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: run-nfs-client-provisioner
subjects:
- kind: ServiceAccount
  name: nfs-client-provisioner
  namespace: kube-system
roleRef:
  kind: ClusterRole
  name: nfs-client-provisioner-runner
  apiGroup: rbac.authorization.k8s.io
---
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: leader-locking-nfs-client-provisioner
rules:
- apiGroups: [""]
  resources: ["endpoints"]
  verbs: ["get", "list", "watch", "create", "update", "patch"]
---
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: leader-locking-nfs-client-provisioner
subjects:
- kind: ServiceAccount
  name: nfs-client-provisioner
  # replace with namespace where provisioner is deployed
  namespace: kube-system
roleRef:
  kind: Role
  name: leader-locking-nfs-client-provisioner
  apiGroup: rbac.authorization.k8s.io
```

- nfs-storage-class.yaml

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: managed-nfs-storage
provisioner: fuseim.pri/ifs
parameters:
  archiveOnDelete: "false"
reclaimPolicy: Retain # 回收策略 默认为Delete 可以配置为 Retain
volumeBindingMode: Immediate # 默认为 Immediate 表示创建 PVC 就立即进行绑定 
```

- nfs-provisioner-deployment.yaml

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: nfs-client-provisioner
  namespace: kube-system
---
kind: Deployment
apiVersion: apps/v1
metadata:
  namespace: kube-system
  name: nfs-client-provisioner
spec:
  replicas: 1
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: nfs-client-provisioner
  template:
    metadata:
      labels:
        app: nfs-client-provisioner
    spec:
      imagePullSecrets: #设置镜像的下载秘钥(例如使用私库下载镜像时,访问私库需要秘钥,就在该位置设置)
        - name: my-aliyun #设置指定秘钥名
      serviceAccount: nfs-client-provisioner
      containers:
        - name: nfs-client-provisioner
          image: registry.cn-hangzhou.aliyuncs.com/mhr/nfs-subdir-external-provisioner:latest
          volumeMounts:
            - name: nfs-client-root
              mountPath: /persistentvolumes
          env:
            - name: PROVISIONER_NAME
              value: fuseim.pri/ifs # 需要和 nfs-storage-class.yaml 中的 provisioner 一致
            - name: NFS_SERVER
              value: 192.168.3.16
            - name: NFS_PATH
              value: /data/nfs/rw
      volumes:
        - name: nfs-client-root
          nfs:
            server: 192.168.3.16
            path: /data/nfs/rw
```

## 执行命令

```shell
kubectl apply -f nfs-provisioner-rbac.yaml 
kubectl apply -f nfs-provisioner-deployment.yaml 
kubectl apply -f nfs-storage-class.yaml 
```
