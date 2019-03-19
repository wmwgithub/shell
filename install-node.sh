#!/bin/bash
#设定要安装的node版本
version='v10.15.1'
#拉取node安装包
sudo wget https://nodejs.org/dist/${version}/node-${version}-linux-x64.tar.xz
sudo tar -xvf node-${version}-linux-x64.tar.xz
#重新命名文件夹
sudo mv node-${version}-linux-x64 nodejs
#拿到当前目录
LocalPath=$(pwd)
#创建软链接
sudo ln -s ${LocalPath}/nodejs/bin/node /usr/local/bin/node
sudo ln -s ${LocalPath}/nodejs/bin/npm /usr/local/bin/npm

