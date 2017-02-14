# php-7-apache

**PHP 7.1 sobre o Apache num Debian Jessie**

Módulos PHP instalados:

* gd
* zip
* xml
* curl

Numa shell Bash faça:

```bash
docker build -t parana/php-7-apache .
docker run -i -t --rm -p 9090:80 -v $PWD/site:/var/www/site parana/php-7-apache
```

Em outra shell Bash execute:

```bash
open http://localhost:9090
```

> Não esqueça de fazer `chown -R www-data:www-data /var/www/site` no caso de adicionar conteúdo ao site


