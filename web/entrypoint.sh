#!/bin/bash


if [ ! -n "$HOST_IP" ]; then
  HOST_IP=`/sbin/ip route|awk '/scope/ { print $9 }'`
fi


if [ ! -n "$GIT_URL" ]; then
  GIT_URL='http://hcn:hcn@172.16.5.35/gogs/hcn/hcn-web.git'
fi

if [ ! -n "$PROFILE" ]; then
  PROFILE='docker#master'
fi

export GIT_URL
export HOST_IP

mkdir -p /tmp/war/build

cd /tmp/war/build

git clone $GIT_URL hcn-web

cd hcn-web

sed -i 's/${HOST_IP}/'$HOST_IP'/g' src/main/resources/package/docker/docker-master.properties
sed -i 's/${HOST_IP}/'$HOST_IP'/g' src/main/resources/package/docker/docker-slave.properties

mvn clean package -Dmaven.test.skip=true -P$PROFILE

cp target/hcn-web-0.1.war /usr/local/tomcat/webapps/hcn-web.war

cd -
exec "$@"