Postgres

> PostgreSQL is a powerful, open source object-relational database system.

# Usage

```shell
docker run --rm -it \
  -e POSTGRES_DB postgres \
  -e POSTGRES_PASSWORD postgres \
  -e POSTGRES_USER postgres \
  -v data:/var/lib/postgresql/data \
  dylanfoster/postgres:9.4
```
