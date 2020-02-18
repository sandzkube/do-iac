To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 192.168.100.198:6443 --token yr5gey.2cd8m0vl3bea3zzq \
    --discovery-token-ca-cert-hash sha256:7c29faeac0ec92b6c6b937a58a3bdc83f1af662025c5c4c0aa46abe2bc5c4fa6
[r