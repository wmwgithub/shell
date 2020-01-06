#!/bin/bash
#指定git版本
LocalPath=$(pwd)
GIT_VERSION='2.22.0'
#安装git 依赖库
yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel
yum install -y gcc perl-ExtUtils-MakeMaker
yum install -y autoconf automake libtool
下载
wget https://github.com/git/git/archive/v${GIT_VERSION}.tar.gz
# 解压
tar -zvxf v${GIT_VERSION}.tar.gz
# 安装 
cd git-$GIT_VERSION
make configure
# 指定安装目录 是/usr/local 不用额外配置环境变量
./configure --prefix=/usr/local
make
make install
# echo "export PATH=$PATH:/opt/git/bin" >> /etc/profile
# 回到运行此代码的目录 删除下载的安装包
cd $LocalPath
rm -rf git-${GIT_VERSION} *.tar.gz*
#移除本身或者安装带来的低版本git 
sudo yum remove -y git
source /etc/profile
git --version
