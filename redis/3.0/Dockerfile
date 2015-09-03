FROM dylanfoster/alpine:3.2
MAINTAINER Dylan Foster <dylan947@gmail.com>

RUN apk --update add redis \
 && sed -i 's/daemonize yes/daemonize no/g' /etc/redis.conf \
 && sed -i 's/# bind 0.0.0.0/bind 0.0.0.0/g' /etc/redis.conf \
 && rm -rf /var/cache/apk/*

CMD ["redis-server", "/etc/redis.conf"]
EXPOSE 6379
