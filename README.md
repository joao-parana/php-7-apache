# php-7-apache

Numa shell Bash faça:

```bash
docker build -t parana/php-7-apache .
docker run -i -t --rm -p 9090:80 -v $PWD/site:/var/www/site parana/php-7-apache
```

Em outra shell Bash execute:

```bash
open http://localhost:9090
```
