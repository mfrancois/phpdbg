Docker image for phpdbg of cli
=================================

## Addtional Extensions

- pdo
- pdo_pgsql
- Intl

and Composer

## Base image

https://hub.docker.com/_/php/

## How to use this image.

With Command Line.

```
docker run -v "$PWD":/usr/src/myapp:cached -w /usr/src/myapp --rm nanasess/phpgdb phpdbg -qrr path/to/phpunit --coverage-clover=coverage.clove
```

By using the Docker container it is possible to avoid the problem of **Too many open files**.


