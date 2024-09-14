apt-get install -y apt-transport-https
curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF


apt-get install -y kubelet=1.25.0-00 kubeadm=1.25.0-00 kubectl=1.25.0-00
crictl config runtime-endpoint unix:///run/containerd/containerd.sock # crictl version报错时，可能是没有设置默认的CRI socket地址
crictl image ls

kubeadm init  --config kubeadm-init.yaml
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


helm repo add cilium https://helm.cilium.io/

cat cilium-values.yaml
bpf:
  hostRouting: true
  masquerade: true
hubble:
  relay:
    enabled: true
  ui:
    enabled: true
ipam:
  mode: kubernetes
k8sServiceHost: 需要改
k8sServicePort: 6443
kubeProxyReplacement: partial
tunnel: vxlan
tunnelProtocol: vxlan

helm upgrade --install cilium cilium/cilium --version 1.13.4 --namespace kube-system -f  cilium-values.yaml
