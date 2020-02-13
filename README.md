# K8S-COURSE-INFRA

Criação de uma infraestrutura na AWS, via Terraform, para realização do curso Descomplicado Kubernetes da LinuxTips.

## Necessidades

* 3 instancias EC2 
* Ubuntu
* 2 core CPU
* 2GB de memória RAM

## Portas

### Master

* kube-apiserver -> 6443 TCP
* etcd server API -> 2379-2380 TPC
* Kubelet API -> 10250 TCP
* kube-scheduler -> 10251 TCP
* kube-controller-manager -> 10252 TCP
* Kubelet API Read-only -> 10255 TCP

## Workers

* Kubelet API -> 10250 TCP
* Kubelet API Read-only -> 10255 TCP
* NodePort Services -> 30000-32767 TCP

No caso, vamos utilizar o Weave como pod network, sendo assim também vamos liberar as seguintes portas:

* Weave -> 6783 TCP e 6783-6784 UDP