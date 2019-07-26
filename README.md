# Ansible roles for deploy HA Kubernetes cluster

* **admin** - configure admin rights for cluster access
* **calico** - install and configure calico 
* **cert** - generates all necessary certificates for Kubernetes and Etcd and copy 
them to hosts
* **coredns** - install and configure coredns
* **crio** - install and configure cri-o
* **etcd** - setup Etcd cluster
* **iptables** - install and configure iptables
* **kube-control-plane** - setup kubernetes master services like kube-apiserver,
controller-manager and scheduler
* **kube-proxy** - install and configure kube-proxy
* **kube-router** - install self-hosted daemonset kube-router
* **kubectl** - install kubectl - cli for kubernetes
* **kubedns** - install kubedns as deployment in cluster
* **kubelet** - install and configure kubelet
* **masters-proxy** - install and configure HA-proxy for kubernetes masters
* **system** - system settings
