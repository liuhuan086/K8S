echo "安装docker需要的包"
yum -y install yum-utils > /dev/null

echo "安装docker源，推荐使用yum-config-manager --add-repo安装方式"
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo > /dev/null

echo "安装docker"
yum install docker-ce -y > /dev/null

echo "创建docker相关目录"
mkdir -p /etc/docker /data/docker > /dev/null

echo "启动docker并设置开机自启"
systemctl start docker && systemctl enable docker > /dev/null
