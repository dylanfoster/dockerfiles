FROM alpine:3.2
MAINTAINER Dylan Foster <dylan947@gmail.com>

RUN adduser -D -u 1000 vader
RUN mkdir -p /data
RUN mkdir -p /config/init

RUN apk --update add git && \
  rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /
COPY config /config

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/sh"]
