FROM dylanfoster/alpine:3.2
MAINTAINER Dylan Foster <dylan947@gmail.com>

RUN apk --update add nginx \
  && rm -rf /var/cache/apk/*

CMD ["nginx", "-g", "daemon off;"]
