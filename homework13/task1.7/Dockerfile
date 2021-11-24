FROM centos
LABEL desc = "Redis-server on centos"
RUN yum -y update
RUN yum install -y redis
EXPOSE 6379
CMD ["redis-server"]