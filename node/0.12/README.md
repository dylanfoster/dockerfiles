Node.js

> Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient. Node.js' package ecosystem, [npm](npmjs.com), is the largest ecosystem of open source libraries in the world.

# Usage

```shell
docker run --rm -it \
  -v $(pwd):/data/app
  -w /data/app
  dylanfoster:node:0.12 node --version
```
