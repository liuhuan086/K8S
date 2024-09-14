#!/usr/bin/env bash
echo "安装nfs"
yum install nfs-utils -y > /dev/null

echo "创建nfs目录并设置权限"
mkdir -p /opt/data && chmod -R 777 /opt/data > /dev/null

echo "修改nfs共享目录配置文件，按需修改"
echo "/opt/data *(rw,no_root_squash)" >> /etc/exports

echo "启动nfs并设置开机自启"
systemctl start nfs && systemctl enable nfs > /dev/null
