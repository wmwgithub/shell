#!/bin/bash
#设定要安装的node版本
version='v10.15.3'
#拉取node安装包
sudo wget https://nodejs.org/dist/${version}/node-${version}-linux-x64.tar.xz
sudo tar -xvf node-${version}-linux-x64.tar.xz
rm -rf node-${version}-linux-x64.tar.xz
#重新命名文件夹
sudo mv node-${version}-linux-x64 nodejs
#拿到当前目录
LocalPath=$(pwd)
#配置环境变量
sudo echo export PATH=$PATH:${LocalPath}/nodejs/bin>>/etc/profile
source /etc/profile

