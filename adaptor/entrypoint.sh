#!/bin/bash


if [ ! -n "$HOST_IP" ]; then
  HOST_IP=`/sbin/ip route|awk '/scope/ { print $9 }'`
fi


if [ ! -n "$GIT_URL" ]; then
  GIT_URL='http://hcn:hcn@172.16.5.35/gogs/hcn/hcn-adapter.git'
fi

if [ ! -n "$PROFILE" ]; then
  PROFILE='docker'
fi

export GIT_URL
export HOST_IP

mkdir -p /tmp/war/build
rm -rf /tmp/war/build
mkdir -p /tmp/war/build

cd /tmp/war/build

git clone $GIT_URL hcn-adapter

cd hcn-adapter

sed -i 's/${HOST_IP}/'$HOST_IP'/g' src/main/resources/package/docker.properties
sed -i 's/${multiHospital_adapter_server}/'$ADAPTER_SERVERS'/g' src/main/resources/package/docker.properties

mvn clean package -Dmaven.test.skip=true -P$PROFILE

rm -rf /usr/local/tomcat/webapps/hcn*
cp target/*.war /usr/local/tomcat/webapps/

cd -
exec "$@"
