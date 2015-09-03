# Alpine

> Alpine Linux is a security-oriented, lightweight Linux distribution based on musl libc and busybox.

Base image built on the official [Alpine:3.2]() image. This image includes a user `vader` with uid of `1000`.

scripts located in `config/init` will always be run, allowing for further modification during builds.

## Usage

```shell
docker run --rm -it dylanfoster/alpine:3.2 sh
```
