FROM alpine
LABEL desc = "Redis-server on alpine"
RUN apk --no-cache add redis
EXPOSE 6379
CMD ["redis-server"]