#!/bin/bash

OUTPUT=/usr/local/opt/hcn-mpi-1.0/conf/mpi.properties

rm -f $OUTPUT

if [ ! -n $RPC_SERVER ]; then
  RPC_SERVER=`/sbin/ip route|awk '/scope/ { print $9 }'`:9003
fi

echo "ssdev.zkHost=$ZK_HOST:$ZK_PORT" >> $OUTPUT
echo "rpc.server=$RPC_SERVER" >> $OUTPUT
echo "redis.server=$REDIS_HOST" >> $OUTPUT
echo "redis.port=$REDIS_PORT" >> $OUTPUT

echo "" >> $OUTPUT

echo "db.url=$MYSQL_URL" >> $OUTPUT
echo "db.user=$MYSQL_USER" >> $OUTPUT
echo "db.password=$MYSQL_PASSWORD" >> $OUTPUT

exec "$@"