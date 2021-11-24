FROM ubuntu
LABEL desc = "Redis-server on ubuntu"
RUN apt-get update
RUN apt-get install -y redis-server
EXPOSE 6379
CMD ["redis-server"]