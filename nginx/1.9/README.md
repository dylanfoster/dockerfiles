Nginx

> nginx is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP proxy server, originally written by [Igor Sysoev](http://sysoev.ru/en/).

# Usage

```shell
docker run --rm -it \
  -p 80:80 \
  -v $(pwd):/usr/share/nginx/html \
  dylanfoster/nginx:1.9.0 nginx
```
