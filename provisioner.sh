#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

apt-get update -y && apt-get upgrade -y
apt-get install -y curl

# Docker
curl -fsSL https://get.docker.com | bash

# Add k8s repo
apt-get update -y && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubelet kubeadm kubectl

# Confs
# docker info | grep -i cgroup
# sed -i "s/cgroup-driver=systemd/cgroup-driver=cgroupfs/g" /etc/systemd/kubelet/service.d/10-kubeadm.conf
# systemctl daemon-reload
# systemctl restart kubelet
# kubeadm config images pull