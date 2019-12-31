Manual scheduling
================================================
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  nodeName: node01
  containers:
  - name: nginx
    image: nginx
================================================
kubectl get pods --selector env=dev
kubectl get pods --selector env=dev --no-headers | wc -l
kubectl get all --selector env=prod --no-headers | wc -l
kubectl get all --selector env=prod,bu=finance,tier=frontend
================================================
kubectl describe nodes node01 | grep -i taint
kubectl taint node node01 spray=mortein:NoSchedule
kubectl taint node master node-role.kubernetes.io/master:NoSchedule-
kubectl get nodes node01 --show-labels
kubectl get nodes node01 --show-labels
================================================
apiVersion: v1
kind: Podmetadata:
  name: bee
spec:
  containers:
  - image: nginx
    name: bee
  tolerations:
  - key: "spray"
    operator: "Equal"
    effect: "NoSchedule"
    value: "mortein"
================================================
https://kubernetes.io/id/docs/concepts/configuration/assign-pod-node/
apiVersion: apps/v1beta1
kind: Deployment
metadata:
  name: blue
spec:
  replicas: 6
  selector:
    matchLabels:
      run: blue
  template:
    metadata:
      labels:
        run: blue
    spec:
      containers:
      - image: nginx
        name: blue
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: color
                operator: In
                values:
                - blue
================================================
apiVersion: apps/v1
kind: Deployment
metadata:
  name: red
spec:
  selector:
    matchLabels:
      app: red
  replicas: 3
  template:
    metadata:
      labels:
        app: red
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: node-role.kubernetes.io/master
                operator: Exists
      containers:
      - name: nginx
        image: nginx
================================================
kubectl get daemonsets --all-namespaces
kubectl describe daemonset kube-proxy --namespace=kube-system

================================================
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: elasticsearch
  namespace: kube-system
  labels:
    k8s-app: elasticsearch
spec:
  selector:
    matchLabels:
      name: elasticsearch
  template:
    metadata:
      labels:
        name: elasticsearch
    spec:
      tolerations:
      - key: node-role.kubernetes.io/master
        effect: NoSchedule
      containers:
      - name: elasticsearch
        image: k8s.gcr.io/fluentd-elasticsearch:1.20
================================================
kubectl run --restart=Never --image=busybox static-busybox --dry-run -o yaml --command -- sleep 1000
> /etc/kubernetes/manifests/static-busybox.yaml

================================================
apiVersion: v1
kind: Podmetadata:
name: nginx
spec:
  schedulerName: my-scheduler
  containers:
  -  image: nginx
     name: nginx
================================================
if you want create schduler take copy from the current one under /etc/kubernetes/manifests/
and add these line
    component: kimo-sec
      name: kimo-sec

- --port=10283
- --scheduler-name=kimo-sec

================================================
#crete Pod with Label
kubectl run messaging --image=redis:alpine --generator=run-pod/v1 --labels=tier=msg
# create namespace 
kubectl create ns apx-x9984574
# output json 
kubectl get nodes -o json > /opt/outputs/nodes-z3444kd9.json
# create svc
kubectl expose pod messaging --port=6379 --name=messaging-service
# create replica
kubectl run hr-web-app --image=kodekloud/webapp-color --replicas=2
# create static Pod 
kubectl run static-busybox --image=busybox --restart=Never --generator=run-pod/v1 --dry-run -o yaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml
# run pod in namespace
kubectl run temp-bus --image=redis:alpine --namespace=finance --generator=run-pod/v1
===============================================
Create service with Node Port 
===============================================
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    run: hr-web-app
  name: hr-web-app-service
spec:
  ports:
  - port: 8080
    protocol: TCP
    targetPort: 8080
    nodePort: 30082
  selector:
    run: hr-web-app
  type: NodePort
status:
  loadBalancer: {}
===============================================
# JsonPath 
kubectl get nodes -o jsonpath="{.items[*].status.nodeInfo.osImage}" > /opt/outputs/nodes_os_x43kj56.txt
===============================================
Create a Persistent Volume
===============================================
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-analytics
spec:
  capacity:
    storage: 100Mi
  accessModes:
    - ReadWriteMany
  hostPath:
    path: "/pv/data-analytics"
===============================================
ETCD Backup
ETCDCTL_API=3 etcdctl --endpoints=https://172.17.0.84:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key snapshot save /tmp/etcd-backup.db

==============================================
apiVersion: v1
kind: Pod
metadata:
  name: redis-storage
spec:
  containers:
  - image: redis:alpine
    name: redis-storage
    volumeMounts:
    - mountPath: /data/redis
      name: redis-storage
  volumes:
  - name: redis-storage
    emptyDir: {}
==============================================
apiVersion: v1
kind: Pod
metadata:
  name: super-user-pod
spec:
  containers:
  - name: super-user-pod
    image: busybox:1.28
    command: ["sleep","4800"]
    securityContext:
      capabilities:
        add: ["SYS_TIME"]

==============================================
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Mi
==============================================

kubectl run nginx-deploy --image=nginx:1.16 --replicas=1 --record
kubectl set image deployment/nginx-deploy nginx-deploy=nginx:1.17 --record

=============================================
kubectl certificate approve john
kubectl create  role developer --resource=Pods --verb=create,list,get,update,delete --namespace=development
kubectl create rolebinding developer-binding --role=developer --user=john --namespace=development
kubectl auth can-i update pods --as=john -n development
=============================================
kubectl run text --image=busybox:1.28 --rm -it nslookup nginx-resolver-service
kubectl run text --image=busybox:1.28 --rm -it nslookup 10-32-0-5.default.pod
=============================================

kubectl run nginx-critical --image=nginx --restart=Never --generator=run-pod/v1 --dry-run -o yaml > nginx-critical.yaml

=============================================
kubectl create serviceaccount pvviewer
kubectl create clusterrole pvviewer-role --resource=persistentvolumes --verb=list
kubectl create clusterrolebinding pvviewer-role-binding --clusterrole=pvviewer-role --serviceaccount=default:pvviewer
=============================================
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: pvviewer
  name: pvviewer
spec:
  serviceAccountName: pvviewer
  containers:
  - image: redis
    imagePullPolicy: IfNotPresent
    name: pvviewer
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
========================================

kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}' >  /root/node_ips

========================================
apiVersion: v1
kind: Pod
metadata:
  name: multi-pod
spec:
  containers:
  - image: nginx
    name: alpha
    env:
    - name: name
      value: alpha
  - image: busybox
    name: beta
    command: ["sleep","4800"]
    env:
    - name: name
      value: beta
========================================
apiVersion: v1
kind: Pod
metadata:
  name: non-root-pod
spec:
  securityContext:
    runAsUser: 1000
    fsGroup: 2000
  containers:
  - image: redis:alpine
    name: non-root-pod
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
========================================
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: ingress-to-nptest
  namespace: default
spec:
  podSelector:
    matchLabels:
      run: np-test-1
  policyTypes:
  - Ingress
  ingress:
  - ports:
    - port: 80
      protocol: TCP
========================================
kubectl taint node node01 env_type=production:NoSchedule
we use Equal when there value 
Exists when there no value 
========================================
apiVersion: v1
kind: Pod
metadata:
  name: prod-redis
spec:
  containers:
  - image: redis:alpine
    name: prod-redis
  tolerations:
  - key: "env_type"
    operator: "Equal"
    effect: "NoSchedule"
    value: "production"
========================================
kubectl create ns hr 
kubectl run hr-pod --image=redis:alpine --generator=run-pod/v1 --labels=environment=production,tier=frontend --namespace=hr
========================================
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: webapp-green
  name: webapp-green
spec:
  containers:
  - image: kodekloud/webapp-color
    imagePullPolicy: IfNotPresent
    name: webapp-green
    command: ["python","app.py"]
    args: ["--color", "green"]
========================================
kubectl get secrets
kubectl create secret generic db-secret --from-literal=DB_Host=sql01 --from-literal=DB_User=root --from-literal=DB_Password=password123
========================================
apiVersion: v1
kind: Pod
metadata:
  name: webapp-pod
spec:
  containers:
  - image: kodekloud/simple-webapp-mysql
    name: webapp-pod
    envFrom:
    - secretRef:
        name: db-secret
========================================
apiVersion: v1
kind: Pod
metadata:
  name: red
  namespace: default
spec:
  initContainers:
  - name: init-myservice
    image: busybox
    command: ["sleep","20"]
  containers:
  - command:
    - sh
    - -c
    - echo The app is running! && sleep 3600
    image: busybox:1.28
    name: red-container
========================================
kubectl drain node01 --ignore-daemonsets
kubectl uncordon node01
kubectl drain node02 --ignore-daemonsets --force
kubectl cordon node03
========================================
kubectl cluster-info
kubectl config view
kubeadm version
kubeadm upgrade plan 
apt install kubeadm=1.12.0-00 
kubeadm upgrade apply v1.12.0
apt install kubelet=1.12.0-00

# how to upgrade worker node .
apt install kubeadm=1.12.0-00
apt install kubelet=1.12.0-00
kubeadm upgrade node config --kubelet-version $(kubelet --version | cut -d ' ' -f 2) 
========================================
kubectl logs etcd-master -n kube-system
kubectl describe pod etcd-master -n kube-system
========================================
ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt \
>      --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key \
>      snapshot save /tmp/snapshot-pre-boot.db
========================================
ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt \
     --name=master \
     --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key \
     --data-dir /var/lib/etcd-from-backup \
     --initial-cluster=master=https://127.0.0.1:2380 \
     --initial-cluster-token etcd-cluster-1 \
     --initial-advertise-peer-urls=https://127.0.0.1:2380 \
     snapshot restore /tmp/snapshot-pre-boot.db

Modify /etc/kubernetes/manifests/etcd.yaml
--data-dir=/var/lib/etcd-from-backup
--initial-cluster-token=etcd-cluster-1
   volumeMounts:
    - mountPath: /var/lib/etcd-from-backup
      name: etcd-data
    - mountPath: /etc/kubernetes/pki/etcd
      name: etcd-certs
  hostNetwork: true
  priorityClassName: system-cluster-critical
  volumes:
  - hostPath:
      path: /var/lib/etcd-from-backup
      type: DirectoryOrCreate
    name: etcd-data
  - hostPath:
      path: /etc/kubernetes/pki/etcd
      type: DirectoryOrCreate
    name: etcd-certs
#change path for etcd-data only 
========================================
kubectl config view --kubeconfig=/root/my-kube-config
kubectl config use-context
kubectl config --kubeconfig=/root/my-kube-config use-context research

========================================
authorization modes configured on the cluster.
kubectl describe pod kube-apiserver-master -n kube-system and look for --authorization-mode
kubectl get role --all-namespaces --no-headers | wc -l
kubectl describe role weave-net -n kube-system
kubectl describe rolebinding weave-net -n kube-system
kubectl get pods --as dev-user
kubectl get clusterrole --no-headers | wc -l
========================================
---
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: node-admin
rules:
- apiGroups: [""]
  resources: ["nodes"]
  verbs: ["get", "watch", "list", "create", "delete"]

---
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: michelle-binding
subjects:
- kind: User
  name: michelle
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: node-admin
  apiGroup: rbac.authorization.k8s.iomaster $

========================================
kubectl exec ubuntu-sleeper whoami
========================================
apiVersion: v1
kind: Pod
metadata:
  name: multi-pod
spec:
  securityContext:
    runAsUser: 1001
  containers:
  -  image: ubuntu
     name: web
     command: ["sleep", "5000"]
     securityContext:
      runAsUser: 1002
  -  image: ubuntu
     name: sidecar
     command: ["sleep", "5000"]
========================================
kubectl exec -it ubuntu-sleeper -- date -s '19 APR 2012 11:14:00'
========================================
kubectl get netpol
kubectl get networkpolicy
=======================================
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: internal-policy
  namespace: default
spec:
  podSelector:
    matchLabels:
      name: internal
  policyTypes:
  - Egress
  - Ingress
  ingress:
    - {}
  egress:
  - to:
    - podSelector:
        matchLabels:
          name: mysql
    ports:
    - protocol: TCP
      port: 3306

  - to:
    - podSelector:
        matchLabels:
          name: payroll
    ports:
    - protocol: TCP
      port: 8080
=======================================
Access Mode for pv and pvc should be the same :
=======================================
network solution this path
/etc/cni/net.d/
=======================================
apiVersion: v1
kind: Pod
metadata:
  name: test
spec:
  nodeName: node03
  containers:
  - image: busybox:1.28
    imagePullPolicy: IfNotPresent
    name: test
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
=======================================
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

kubectl logs <weave-pod-name> weave -n kube-system
The network is configured with weave. Check the weave pods logs using command kubectl logs <weave-pod-name> weave -n kube-system and look for ipalloc-range

kubectl logs   weave-net-tzmlj weave  -n kube-system | grep ipalloc-range
kubectl logs   weave-net-tzmlj weave  -n kube-system
ps -aux | grep kube-api
kubectl logs kube-proxy-ft6n7 -n kube-system
kubectl get service -n kube-system
kubectl exec  coredns-78fcdf6894-7vr8x -n kube-system ps
kubectl describe configmap coredns -n kube-system

kubectl exec hr -it  nslookup mysql.payroll
=======================================
kubectl get ingress --all-namespaces
kubectl describe ingress --namespace app-space
kubectl edit ingress --namespace app-space
========================================
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: test-ingress
  namespace: critical-space
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - http:
      paths:
      - path: /pay
        backend:
          serviceName: pay-service
          servicePort: 8282
========================================
1- open the ports 
sudo ufw allow 32767/tcp

2- install docker in poth master and worker nodes .
apt-get install docker
systemctl enable docker
3-

sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
========================================

https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
========================================
kubectl get nodes -o json > /opt/outputs/nodes.json
kubectl get nodes node01 -o json >  /opt/outputs/node01.json
kubectl get nodes -o=jsonpath='{.items[*].metadata.name}' > /opt/outputs/node_names.txt
kubectl get nodes -o jsonpath='{.items[*].status.nodeInfo.osImage}' > /opt/outputs/nodes_os.txt
kubectl config view --kubeconfig=my-kube-config -o jsonpath="{.users[*].name}" > /opt/outputs/users.txt
kubectl get pv --sort-by=.spec.capacity.storage > /opt/outputs/storage-capacity-sorted.txt
kubectl get pv --sort-by=.spec.capacity.storage -o=custom-columns=NAME:.metadata.name,CAPACITY:.spec.capacity.storage
kubectl config view --kubeconfig=my-kube-config -o jsonpath="{.contexts[?(@.context.user=='aws-user')].name}" > /opt/outputs/aws-context-name
kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}' >  /root/node_ips



TLS Ceretficate
openssl x509 -in apiserver.crt -text -noout ## To view any cert
openssl genrsa -out jane.key 2048 #### To create key
openssl req -new -key jane.key -subj "/CN=jane" -out jane.csr ### TO generate CSR
openssl x509 -req -in /etc/kubernetes/pki/apiserver-etcd-client.csr -CA /etc/kubernetes/pki/etcd/ca.crt -CAkey /etc/kubernetes/pki/etcd/ca.key -CAcreateserial -out /etc/kubernetes/pki/apiserver-etcd-client.crtmaster ### for signing CSR

========================
How to create initContainers


apiVersion: v1
kind: Pod
metadata:
  name: mydb
  labels:    app: db
spec:
  initContainers:
    - name: folder      image: busybox:1.28
      command: ['sh', '-c', '/bin/touch /work/hello.txt']
      volumeMounts:
        - mountPath: /work
          name: work
  containers:    - name: ubuntu
      image: busybox:1.28
      command: ["sleep","2000"]
      volumeMounts:
        - mountPath: /work
          name: work
  volumes:
    - emptyDir: {}
      name: work

========================
