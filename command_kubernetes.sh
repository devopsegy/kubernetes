https://www.cloudping.info/
Exam:

========================================================
#How to install kubernetes on centos7
https://www.linuxtechi.com/install-kubernetes-1-7-centos7-rhel7/
========================================================
https://kodekloud.com/p/practice-test-kubernetes-ckad-pods
https://kodekloud.com/p/practice-test-kubernetes-ckad-deployments
https://kodekloud.com/p/practice-test-kubernetes-ckad-namespaces
https://kodekloud.com/p/practice-test-kubernetes-for-beginners-services
https://kodekloud.com/p/practice-test-kubernetes-cka-imperative-1
https://kodekloud.com/p/practice-test-kubernetes-cka-scheduler-manual
https://kodekloud.com/p/practice-test-kubernetes-ckad-labels-and-selectors
https://kodekloud.com/p/practice-test-kubernetes-ckad-resource-limits
https://kodekloud.com/p/practice-test-kubernetes-cka-scheduler-static-pods
https://kodekloud.com/p/practice-test-kubernetes-cka-scheduler-multiple
https://kodekloud.com/p/practice-test-kubernetes-ckad-taints-tolerations
https://kodekloud.com/p/practice-test-kubernetes-ckad-node-affinity
https://kodekloud.com/p/practice-test-kubernetes-ckad-monitoring
https://kodekloud.com/p/practice-test-kubernetes-ckad-logging
https://kodekloud.com/p/practice-test-kubernetes-ckad-rolling-updates-and-rollbacks
https://kodekloud.com/p/practice-test-kubernetes-ckad-commands-and-arguments
https://kodekloud.com/p/practice-test-kubernetes-ckad-configmaps
https://kodekloud.com/p/practice-test-kubernetes-ckad-secrets
https://kodekloud.com/p/practice-test-kubernetes-ckad-multicontainer-pods
https://kodekloud.com/p/practice-test-kubernetes-cka-init-containers
https://kodekloud.com/p/practice-test-kubernetes-ckad-configmaps
https://kodekloud.com/p/practice-test-kubernetes-cka-cluster-maintenance-node
https://kodekloud.com/p/practice-test-kubernetes-cka-backup-etcd
https://kodekloud.com/p/practice-test-kubernetes-cka-security-tls-1-read-certs
https://kodekloud.com/p/practice-test-kubernetes-cka-security-certificates-api
https://kodekloud.com/p/practice-test-kubernetes-cka-security-kubeconfig
https://kodekloud.com/p/practice-test-kubernetes-cka-security-authorization-rbac
https://kodekloud.com/p/practice-test-kubernetes-cka-security-authorization-clusterroles
https://kodekloud.com/p/practice-test-kubernetes-cka-security-image-security
https://kodekloud.com/p/practice-test-kubernetes-ckad-security-contexts
https://kodekloud.com/p/practice-test-kubernetes-ckad-network-policies
https://kodekloud.com/p/practice-test-kubernetes-ckad-persistent-volumes


# how to take backup from etcd
https://github.com/mmumshad/kubernetes-the-hard-way/blob/master/practice-questions-answers/cluster-maintenance/backup-etcd/etcd-backup-and-restore.md
========================================================




#Here is a link to kubernetes documentation if you want to learn more about this topic (You don't need it for the exam though):
https://kubernetes.io/docs/concepts/overview/kubernetes-api/
https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md
https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api_changes.md
https://kubernetes.io/docs/home/
https://kubernetes.io/docs/reference/kubectl/conventions/
https://tachingchen.com/blog/kubernetes-rolling-update-with-deployment/    # important link for deployment
========================================================
docker: the container runtime, which Kubernetes depends on. v1.12 is recommended, but v1.10 and v1.11 are known to work as well. v1.13 and 17.03+ have not yet been tested and verified by the Kubernetes node team.
kubelet: the most core component of Kubernetes. It runs on all of the machines in your cluster and does things like starting pods and containers.
kubectl: the command to control the cluster once it is running . You will only need this on the master, but it can be useful to have on the other nodes as well .
kubeadm: the command to bootstrap the cluster.

kubeadm init #to bootstrap a Kubernetes control-plane node
kubeadm join #to bootstrap a Kubernetes worker node and join it to the cluster
kubeadm upgrade #to upgrade a Kubernetes cluster to a newer version
kubeadm config #if you initialized your cluster using kubeadm v1.7.x or lower, to configure your cluster for kubeadm upgrade
kubeadm token #to manage tokens for kubeadm join
kubeadm reset #to revert any changes made to this host by kubeadm init or kubeadm join
kubeadm version #to print the kubeadm version
kubeadm alpha #to preview a set of features made available for gathering feedback from the community

========================================================
# upgrade kubernetes
#https://medium.com/faun/how-to-upgrade-your-kubernetes-cluster-to-1-13-0-with-kubeadm-on-ubuntu-16-04-75a436941bb3
apt-get update
apt-get upgrade -y kubelet kubeadm
kubeadm upgrade plan # check the cluster if can be upgrade
kubeadm upgrade apply v1.13.0

========================================================



kubectl describe pod
kubectl get pods -o wide ## important

kubectl get all
kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name --all-namespaces
kubectl edit pod <pod name>

kubectl run nginx # will run pod with nginx
kubectl run nginx --image nginx
kubectl run nginx --image=nginx
kubectl run --generator=run-pod/v1 nginx --image=nginx
kubectl get pods --all-namespaces # all pods in namespace
kubectl attach (podname) -i # to login inside the pod
kubectl attach sendbad -i
kubectl attach sendbad
kubectl exec (podname) -- command # to run command inside the pod
kubectl exec shell-demo -- ps aux
kubectl exec shell-demo  -- cat /proc/1/mounts

kubectl exec -it shell-demo -- /bin/bash



kubectl delete pods myapp --grace-period=0 --force


# if you want to know the image name or the errors or how many containers are created on that pods
# this will give you more details about the pods status

kubectl describe pod newpods-vchgw


# if you want to know where the pods are created or on which node are created run .
# also it will give you more details like ip for that pods


kubectl get pods -o wide



# single pods can have multiple containers
kubectl get pods # to list all  pods in your cluster .
kubectl get nodes # to list all nodes in the cluster

## Ready column means how many containers on that pods

master $ kubectl get pods -o wide
NAME                     READY     STATUS             RESTARTS   AGE       IP          NODE      NOMINATED NODE
newpods-jgf4g            1/1       Running            0          14m       10.32.0.4   node01    <none>


# to delete pods
kubectl delete pod webapp


##

To create pods from yaml file
https://kubernetes.io/docs/concepts/workloads/pods/pod-overview/
kubectl create -f redis.yaml


# to fix pods you can run or edit image name .
kubectl edit pod redis

# there is 2 type of replication 1- replicationcontrollers 2- ReplicaSet
# to know how many replicationcontrollers are created
kubectl create -f  replica.yaml
# if you want to change the number of replica you can edit the file and run the belpw command.
kubectl create namespace dev
kubectl replace -f replica.yaml
kubectl scale --replicas=6 -f replica.yaml
kubectl create -f replica.yaml --namespace=dev

#To delete replica
kubectl delete replicaset myapp-rc
kubectl get replicationcontrollers


# how to list all pods in namespace
kubectl get pods --namespace=kube-system
kubectl get pods --namespace=dev
kubectl get pods --all-namespace
kubectl describe namespaces dev


#to set the namespace without mention namespace option

kubectl config set-context $(kubectl config current-context) --namespace=dev



### yaml file important
========================================================
apiVersion: v1
kind:
metadata:

spec:


========================================================

#how to create namespace
kubectl create namespace dev
kubectl create namespace prodaction

# Services enable group off pods to communicate with each other
# Service type (NodePort , ClusterIP , LoadBalancer )
# selector will link the service to the pods
# DaemonSet ensures that all (or some) Nodes run a copy of a Pod. As nodes are added to the cluster, Pods are added to them. As nodes are removed from the cluster, those Pods are garbage collected. Deleting a DaemonSet will clean up the Pods it created.

kubectl get services
kubectl get daemonsets

# Kubelet pods files location (Static Pods)
/etc/kubernetes/mainfests
/etc/kubernetes/manifests/kube-apiserver.yaml
# to create static pod
#Create a pod definition file in the manifests folder.
kubectl run --restart=Never --image=busybox static-busybox --dry-run -o yaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml

#if you want to know which scheduler working run .
kubectl get pods --namespace=kube-system
kubectl get events
kubectl logs my-scheduler --namespace=kube-system
# how to create new scheduler
kubectl create -f my-scheduler.yaml
# when you create the pods into yaml file you can specify the scheduler name .
# Taint -NODE
# Taint mean avoid specific node when you add into the yaml file you tell the pods avoid that
#this node .
kubectl describe node kubemaster | grep Taint
Kubectl taint nodes node-name key=value:taint-effect
kubectl taint nodes node1 app=blue:NoSchedule




# To know how many node on the system .
kubectl get nodes
#Do any taints exist on node01?
kubectl describe node node01
kubectl describe node node01 | grep Taint
# Create a taint on node01 with key of 'spray', value of 'mortein' and effect of 'NoSchedule'
kubectl taint nodes node01 spray=mortein:NoSchedule
#Remove the taint on master, which currently has the taint effect of NoSchedule
kubectl taint nodes master node-role.kubernetes.io/master:NoSchedule-
# To know the pods in which nodes you can run
kubectl get pods -o wide
# Node selector >>
# To label node you can run the below command name off node will be (Large)
kubectl label nodes node-1 size=Large

# Node Affinity
# Node affinity types
# https://banzaicloud.com/blog/k8s-taints-tolerations-affinities/
requiredDuringSchedulingRequiredDuringExecution
requiredDuringSchedulingIgnoredDuringExecution
requiredDuringScheduling - the pod must be scheduled to node(s) that match the expressions listed under matchExpressions
IgnoredDuringExecution indicates that the node affinity only applies during pod scheduling, it doesn’t apply to already running pods


# Monitoring Pods
kubectl top pod
kubectl top node
kubectl logs –f pod_name
kubectl get services --watch


# Rollout Command
kubectl rollout status deployments/myapp-deployment
# to undo the deployment
kubectl rollout undo deployment/myapp-deployment


========================================================
#to update the image run the below command

kubectl rollout undo deployment/nginx-deployment
========================================================
#apply changes
kubectl apply -f https://k8s.io/examples/controllers/nginx-deployment.yaml
kubectl set image deployment/nginx-deployment nginx=1.9.1
kubectl get deployments
kubectl rollout status deployment.v1.apps/nginx-deployment
kubectl get deployments
kubectl get rs
kubectl get pods --show-labels
kubectl rollout undo deployment/nginx-deployment
# to see the deployment details you can run the below command
kubectl describe deployment my-app
========================================================
# very Important for deployment
kubectl create -f deployment-definition.yml ## to create deployment
kubectl get deployments # to list all deployment
kubectl describe deployment # get information about all deployment
kubectl apply -f  deployment-definition.yml # to update the deployment with the new update
kubectl set image deployment/myapp-deployment nginx=nginx:1.9.1 # same for update but another way .
kubectl rollout pause deployment <deployment> #Pause Rolling Update
kubectl rollout resume deployment <deployment> #Resume Rolling Update
kubectl edit deployment frontend # to edit deployment
kubectl rollout status deployment/myapp # to check the deployment status
kubectl rollout history deployment/myapp # to check the deployment status
kubectl  rollout undo deployment/myapp # in order to rollback
kubectl edit deployment frontend # update the strategy type for the existing deployment.
========================================================
## Kubernetes deployment strategies
recreate: terminate the old version and release the new one
ramped: release a new version on a rolling update fashion, one after the other
blue/green: release a new version alongside the old version then switch traffic
canary: release a new version to a subset of users, then proceed to a full rollout
a/b testing: release a new version to a subset of users in a precise way (HTTP headers, cookie, weight, etc.). A/B testing is really a technique for making business decisions based on statistics but we will briefly describe the process. This doesn’t come out of the box with Kubernetes, it implies extra work to setup a more advanced infrastructure (Istio, Linkerd, Traefik, custom nginx/haproxy, etc).
You can experiment with each of these strategies using Minikube, the manifests and steps to follow are explained in this repository: https://github.com/ContainerSolutions/k8s-deployment-strategies
========================================================
# ConfigMap
# how to create ConfigMap
kubectl create configmap my-confogmap --from-literal=APP_COLOR=blue
kubectl create configmap my-confogmap --from-literal=<key>=<value>
kubectl create configmap my-confogmap --from-literal=PASSWORD=LDSSJDD
kubectl create configmap my-confogmap --from-literal=APP_COLOR=blue --from-literal=APP_MOD=prod
kubectl get configmaps # to list all ConfigMap
kubectl describe configmaps
#to call the configmap from yml file add
envFrom:
  - configMapRef:
        name: mysql_config
========================================================
# How to create secret
kubectl create secret generic database_password --from-literal=DB_HOST=localhost --from-literal=DB_USER=mysql --from-literal=DB_PASSWORD=kdsjddsd
# or you can create yml file
kubectl create -f secret-data.yaml
kubectl get secret
kubectl describe secrets
#to call the configmap from yml file add
envFrom:
  - secretRef
        name: mysql-secret

========================================================
# backup and DR
# if you want move pods from node to another you can drain the node and k8s will move the pods automatically
kubectl drain node-1
kubectl drain node01 --ignore-daemonsets
# if node was down and you drain it and the node back online and you need it you can run the below command
kubectl uncordon node-1
kubectl describe node master
# if you denay kubernetes to create pod in specific node you can run
kubectl cordon node03

========================================================
# upgrade kubernetes
kubectl upgrade plan
kubectl upgrade apply
kubeadm upgrade plan

apt-get upgrade -y kubeadm=1.12.0.0-00
kubeadm upgrade apply v1.12.0

apt-get upgrade -y kubelet=1.12.0.0-00
systemctl restart kubelet
kubectl get node
# after fnish from master node run the command in the other node but you have to run the below command first
kubectl drain node-1 # run from master
# go to the node1 and upgrade the kubelet
apt-get upgrade -y kubelet=1.12.0.0-00
systemctl restart kubelet
#then from the master run
kubectl uncordon node-1
========================================================
#backup resource and config
kubectl get all --all-namespaces -o yaml > all-deploy-service.yaml

#backup - ETCD
# how to know etcd Version .

ETCDCTL_API=3 etcdctl snapshot save snapshot.db
kubectl logs etcd-master -n kube-system
kubectl describe pod etcd-master -n kube-system

# ETCD pod configuration
kubectl describe pod etcd-master -n kube-system
# ETCD CA Certificate
# to know the Certificate location
kubectl describe pod etcd-master -n kube-system

--peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt
--peer-client-cert-auth=true
--peer-key-file=/etc/kubernetes/pki/etcd/peer.key
--peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt


# How to take backup from etcd
ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt \
     --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key \
     snapshot save /tmp/snapshot-pre-boot.db



# how to restor etcd backup
ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt \
     --name=master \
     --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key \
     --data-dir /var/lib/etcd-from-backup \
     --initial-cluster=master=https://127.0.0.1:2380 \
     --initial-cluster-token etcd-cluster-1 \
     --initial-advertise-peer-urls=https://127.0.0.1:2380 \
     snapshot restore /tmp/snapshot-pre-boot.db
# reference
https://github.com/etcd-io/etcd/blob/master/Documentation/op-guide/recovery.md
========================================================
# Account and service Account
kubectl create serviceaccount sis1
kubectl list serviceaccount
# You can create csv file and sort all user and password into this file .
password,kimo,u100
password1,islam,u101
password2,ahmed,u102

# after run
kube-apiserver --basic-auth-file=user.csv
========================================================
# how to create key
openssl genrsa -out my-bank.key 1024
my-bank.key

openssl rsa -in my-bank.key -pubout > my-bank.pem
my-bank.pem

# server Certificate for Server
kube-api  > apiserver.crt apiserver.key
etcd      > etcdserver.crt etcdserver.key
kubelet   > kubelet.crt    kubelet.key

# admin user create Certificate
openssl genrsa -out admin.key 2048
openssl req -new -key admin.key -subj "/CN=kube-admin" -out admin.csr
openssl - req x509 -req in admin.csr -CA ca.crt -CAkey ca.key -out admin.crt

# Certificate path you will find it in this file .
/etc/systemd/system/kube-apiserver.service
/etc/kubernetes/manifests/kube-apiserver.yaml
# if you want check the logs .
kubectl get csr
kubectl Certificate approve kimo
kubectl get csr kimo -o yaml

journalctl -u etcd.service -l
kubectl logs etcd-master
docker logs

========================================================
kubeConfig file
$HOME/.kube/config

# the kubeconfig has 3 section
cluster
user
contexts

# To display cluster user and info
kubectl config v1
kubectl config view --kubeconfig=my-custom-config
# default kubeconfig
/root/.kube/config
# to know how many cluster are installed
kubectl config view

kubectl config view --kubeconfig my-kube-config

#If you want to use the dev-user to access test-cluster-1. Set the current context to the right one so I can do that.
kubectl config --kubeconfig=/root/my-kube-config use-context research
# We don't want to have to specify the kubeconfig file option on each command. Make the my-kube-config file the default kubeconfig.
kubectl config view --kubeconfig my-kube-config  > /root/.kube/config

# if you want edit crt path or change user in the config file
/root/.kube/config


========================================================
#Kubernetes API
curl https://kube-master:6443/version
# list off pods
curl https://kube-master:6443/api/v1/pods
# API urls
/metrics
/healthz
/version
/api
/apis
/logs
# If you want to know api groups run the below command .
curl http://localhost:6443/apis -k | grep "name"

# If you want to display the roles
kubectl get roles
kubectl get rolebindings
kubectl describe role sis_developer
kubectl describe rolebindings sis_developer

# if you want check if you have access to specific group

kubectl auth can-i create deployments # output yes or no
kubectl auth can-i delete nodes
kubectl auth can-i create deployment --as dev-user
kubectl auth can-i create pods --as dev-user
kubectl auth can-i create pods --as dev-user --namespace
#Inspect the environment and identify the authorization modes configured on the cluster.
kubectl describe pod kube-apiserver-master -n kube-system # and look for --authorization-mode
# How many roles exist in the default namespace?
kubectl get roles
# How many roles exist in all namespaces together?

kubectl get roles --all-namespaces.
# What are the resources the weave-net role in the kube-system namespce is given access to?










========================================================
#in yaml file when you find image: nginx/nginx
      image: docker.io/user_accout/image_rep
# create secret in order to login to your repository
kubectl create secret docker-registry sis_repo \
   --docker-server= private-registry.io \
   --docker-username= kimo \
   --docker-password= kim@123 \
   --docker-email= m.ali.othman@gmail.com
# after creating secret , you have to pull this info by adding the below value in yaml file .
  imagePullSecrets:
  - name:sis_repo

========================================================
ingress # mean incoming traffic
egress # mean outgoing traffic
========================================================
# :::: NetWorking :::::
# How many network policies do you see in the environment?
kubectl get networkpolicy
#What type of traffic is this Network Policy configured to handle?
kubectl describe networkpolicy
Policy Types: Ingress


# how to route your subnet to specific GW
ip route add 192.168.1.0/24 via 192.168.1.1
ip route add default via 192.168.1.1
# Enable ip forward
echo 1 > /proc/sys/net/ipv4/ip_forward

ip link ## List all interfaces
ip addr ## list interfaces and ip address
ip addr add 192.168.1.10/24 dev eth0
ip route # list routing table
***************************************
* how to configure namespace with IP .
*
***************************************
# how to create network namespce
ip netns add red
ip netns add blue
# to link two namespaces
ip link add veth-red type veth peer name veth-blue

# to asigen interface to namespace
ip link set veth-red netns red
ip link set veth-blue netns blue

# to assign ip address to interface
ip -n red addr add 192.168.8.10 veth-red
ip -n blue addr add 192.168.8.20 veth-blue

# how to restart network interface

ip -n red link set veth-red up
ip -n blue link set veth-blue up

# how to create bridge .
ip link add v-net-0 type bridge

# to display the bridge
ip link
# to start the bridage and attache the other namespce with that bridge
ip link set dev v-net-0 up
ip link add veth-red type veth peer name veth-red-br # namespace interface veth-red
ip link add veth-blue type veth peer name veth-blue-br # namespace interface veth-blue
ip link set veth-red netns red # link interface with namespace red
ip link set veth-red-br   master v-net-0 # link the interface with the bridge v-net-0

ip link set veth-blue netns blue # link interface with namespace blue
ip -n red link del veth-red # to remove interface from the namespce

ip link set veth-blue-br   master v-net-0 # link the interface with the bridge v-net-0

ip -n red addr add 192.168.10.10 dev veth-red # link interface veth-red with ip address
ip -n blue addr add 192.168.10.10 dev veth-blue # link interface veth-blue with ip address

ip -n red link set veth-red up # start the interface veth-red
ip -n blue link set veth-blue up # start the interface veth-blue

ip addr add 192.168.10.5 dev v-net-0 # link bridge interface with ip address .

# you have to add the subnet to routing table in order to reach out the network
here i will link the namespace with gateway
ip netns exec blue ip route add 192.168.10.0/24 via 192.168.10.5


***************************************
# List docker network .
 docker network ls
 # add bridge
 # bridge add (cid) (namespace)

 bridge add 218211287 /var/run/netns/218211287
 docker run --network=none nginx










# what's CLI means
conttainer network interface

# how to create network namespce
ip netns delete  blue

# EXEC in network NS
ip link
ip netns exec red ip link
ip -n red link

# if you wnat to see the routing table
arp
ip netns exec red arp
#





************************************
###################
# net-script.sh   #
###################

# create veth pair
ip link add
ip link add v-net-0 type bridge

# Attach veth pair
ip link set
ip link set dev v-net-0 up
ip addr add 10.244.1.1/24 dev v-net-0


# Assign IP Address
ip -n <namespace> addr add
ip -n <namespace> route add

# Bring Up Interface
ip -n <namespce> link set
************************************

# CNI
Container networking interface

cat /etc/cni/net.d/10-bridge.conf

# how to deply weave
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
kubectl get pods -n kube-system
kubectl logs weave-net-5gcmb weave -n kube-system
# if you want display services
kubelet get service
# if you need to check open port for the services
iptables -L -t net | grep db-service
cat /var/log/kube-proxy.log

# CoreDNS
cat /etc/coredns/Corefile

# Identify the DNS solution implemented in this cluster.
kubectl get pods -n kube-system

# How many pods of the DNS server are deployed?
 kubectl get deploy -n kube-system
# What is the name of the service created for accessing CoreDNS?
kubectl get service -n kube-system
# What is the IP of the CoreDNS server that should be configured on PODs to resolve services?
kubectl get service -n kube-system #look for cluster IP value.
# Where is the configuration file located for configuring the CoreDNS service?
kubectl exec <core-dns-pod-name> -n kube-system ps
kubectl exec coredns-78fcdf6894-gcw6x -n kube-system ps


# What is the name of the ConfigMap object created for Corefile?

kubectl get configmap -n kube-system
#What is the root domain/zone configured for this kubernetes cluster?
 kubectl describe configmap coredns -n kube-system #and look for the entry after kubernetes

# how to describe ingress
kubectl describe ingress ingress-wear-watch
# If you want to know where is ETCD
cat /etc/systemd/system/kube-apiserver.service

https://github.com/mmumshad/kubernetes-the-hard-way
















































































































========================================================
kubectl get services                # List all services
kubectl get pods                    # List all pods
kubectl get nodes -w                # Watch nodes continuously
kubectl version                     # Get version information
kubectl cluster-info                # Get cluster information
kubectl config view                 # Get the configuration
kubectl describe node <node>        # Output information about a node
kubectl get pods                         # List the current pods
kubectl describe pod <name>              # Describe pod <name>
kubectl get rc                           # List the replication controllers
kubectl get rc --namespace="<namespace>" # List the replication controllers in <namespace>
kubectl describe rc <name>               # Describe replication controller <name>
kubectl get svc                          # List the services
kubectl describe svc <name>              # Describe service <name>

kubectl run <name> --image=<image-name>                             # Launch a pod called <name>
                                                                    # using image <image-name>
kubectl create -f <manifest.yaml>                                   # Create a service described
                                                                    # in <manifest.yaml>
kubectl scale --replicas=<count> rc <name>                          # Scale replication controller
                                                                    # <name> to <count> instances
kubectl expose rc <name> --port=<external> --target-port=<internal> # Map port <external> to
                                                                    # port <internal> on replication
                                                                    # controller <name>
kubectl delete pod <name>                                         # Delete pod <name>
kubectl delete rc <name>                                          # Delete replication controller <name>
kubectl delete svc <name>                                         # Delete service <name>
kubectl drain <n> --delete-local-data --force --ignore-daemonsets # Stop all pods on <n>
kubectl delete node <name>                                        # Remove <node> from the cluster
kubectl exec <service> <command> [-c <$container>] # execute <command> on <service>, optionally
                                                   # selecting container <$container>
kubectl logs -f <name> [-c <$container>]           # Get logs from service <name>, optionally
                                                   # selecting container <$container>
watch -n 2 cat /var/log/kublet.log                 # Watch the Kublet logs
kubectl top node                                   # Show metrics for nodes
kubectl top pod                                    # Show metrics for pods
kubeadm init                                              # Initialize your master node
kubeadm join --token <token> <master-ip>:<master-port>    # Join a node to your Kubernetes cluster
kubectl create namespace <namespace>                      # Create namespace <name>
kubectl taint nodes --all node-role.kubernetes.io/master- # Allow Kubernetes master nodes to run pods
kubeadm reset                                             # Reset current state
kubectl get secrets                                       # List all secrets
========================================================
Troubleshooting .
#Check Service Status
curl http://web-service-ip:node-port
kubectl describe service web-service

#Check POD
kubectl describe pod web
kubectl logs web -f --previous

#Check Node Status
kubectl get nodes
kubectl get pods

#Check Controlplane Pods
kubectl get pods -n kube-system

#Check Controlplane Services
service kube-apiserver status
service kube-controller-manager status
service kube-scheduler status
service kubelet status
service kube-proxy status

#Check Service Logs
kubectl logs kube-apiserver-master -n kube-system
sudo journalctl -u kube-apiserver

#Check Node Status
kubectl get nodes
kubectl describe node worker-1


#Check Kubelet Status
service kubelet status
sudo journalctl –u kubelet

#Check Certificates
openssl x509 -in /var/lib/kubelet/worker-1.crt -text
####################
# Start minikube on mac os , this only for learning
minikube start --vm-driver=virtualbox
minikube delte
####################
#how to install kops
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x ./kops
sudo mv ./kops /usr/local/bin/
pip install awscli
aws configure
# to create cluster with kops on aws
kops create cluster --name=kubernetes.zellahost.com --state=s3://kops-state-kissme --zones=eu-wst-1a --node-count=2 --node-size=t2.micro --master-size=t2.micro --dns-zone=kubernetes.zellahost.com
kops update cluster kubernetes.zellahost.com --yes --state=s3://kops-state-kissme
#configuration path
# you will find the password and username for the Kubernetes api
cat ~/.kube/config

# if you want edit the cluster
kops edit cluster kubernetes.zellahost.com --state=s3://kops-state-kissme
# To test your deployment
kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
kubectl expose deployment hello-minikube --type=NodePort
kubectl get services
#you have to edit security group in aws, In order to access your web deployment

# To delete the cluster
kops delete cluster kubernetes.zellahost.com --state=s3://kops-state-kissme
kops delete cluster kubernetes.zellahost.com --state=s3://kops-state-kissme --yes
# to get the url from minikube
minikube service sendbag.com --url
