
#!/bin/bash

name=gf-tomcat
ver=`date "+%Y%m%d"`


echo version: $ver

cd $(cd `dirname $0`;pwd)
sudo docker build -t $name:$ver .

