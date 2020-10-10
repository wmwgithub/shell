#!/bin/bash
# 卸载掉旧docker
sudo yum remove docker docker-common docker-selinux docker-engine
# 安装一些必要的依赖
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
# 下载docker repo文件
wget -O /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/centos/docker-ce.repo
# 软件仓库地址换成清华
sudo sed -i 's+download.docker.com+mirrors.tuna.tsinghua.edu.cn/docker-ce+' /etc/yum.repos.d/docker-ce.repo
sudo yum makecache fast
sudo yum -y install docker-ce
# docker 配置
DockerPath='/etc/docker'
#直接检测指定路径是不是文件夹 不是就创建
if [ -d $DockerPath ]
then
   echo "目录存在"
else
   echo "目录不存在"
   sudo mkdir -p $DockerPath 
fi
sudo touch $DockerPath/daemon.json
sudo tee $DockerPath/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://sa2j00f8.mirror.aliyuncs.com"]
}
EOF
sudo systemctl start docker
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl enable docker
docker info 
