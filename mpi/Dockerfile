FROM openjdk:8
MAINTAINER xiasp <xiasp@bsoft.com.cn>

RUN apt-get install -y unzip && mkdir /usr/local/opt

ADD hcn-mpi-1.0-bin.zip /usr/local/opt/hcn-mpi-1.0-bin.zip

ADD entryPoint.sh /usr/local/opt/entryPoint.sh

RUN cd /usr/local/opt && unzip hcn-mpi-1.0-bin.zip && rm -f hcn-mpi-1.0-bin.zip

ADD start.sh /usr/local/opt/hcn-mpi-1.0/start.sh

RUN chmod +x /usr/local/opt/entryPoint.sh && chmod +x /usr/local/opt/hcn-mpi-1.0/start.sh

ENV ZK_HOST  ZK:2181
#ENV RPC_SERVER 127.0.0.1:9003
ENV REDIS_HOST REDIS
ENV REDIS_PORT 6379

ENV MYSQL_URL jdbc:mysql://mysql/hcn
ENV MYSQL_USER hcn
ENV MYSQL_PASSWORD password

ENTRYPOINT ["/usr/local/opt/entryPoint.sh"]
CMD ["/usr/local/opt/hcn-mpi-1.0/start.sh"]
