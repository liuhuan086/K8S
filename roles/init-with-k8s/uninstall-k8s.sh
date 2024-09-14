kubectl delete deploy --all  -n default
kubectl delete po --all  -n default --grace-period=0 --force
kubectl delete svc --all  -n default
kubectl delete cm --all  -n default
kubectl delete deploy --all  -n default
kubectl delete deploy --all  -n kube-system
kubectl delete po --all  -n kube-system --grace-period=0 --force
kubectl delete svc --all  -n kube-system
kubectl delete cm --all  -n kube-system
kubectl label node --all  master-
kubectl label node --all  node-
kubectl label node --all  nodeno-
kubectl label node --all  zone-
kubectl delete node --all
kubectl delete  clusterrolebindings kubelet-bootstrap
kubectl delete  clusterrolebindings kubelet-admin

rm -rf /etc/kubernetes*
rm -rf /var/lib/etcd
rm -rf /opt/data/*
rm -rf ~/.kube/
rm -rf /etc/cni
rm -rf /opt/cni
rm -rf /var/lib/etcd
rm -rf /var/etcd

systemctl daemon-reload

reboot
