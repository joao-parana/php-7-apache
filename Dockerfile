FROM php:7.1-apache
#
# php:7.1-apache usa a versão 8 do Debian de codinome Jessie
#
MAINTAINER João Antonio Ferreira "joao.parana@gmail.com"

ENV REFRESHED_AT 2017-02-14

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# Habilitando o módulo mod_rewrite que permite usar
# as regras RewriteRule do Apache
RUN a2enmod rewrite

# instalando as extensões PHP que precisaremos
RUN apt-get update \
  && apt-get install -y libpng12-dev libjpeg-dev libxml2-dev \
  && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd \
  && docker-php-ext-install zip \
  && docker-php-ext-install xml

RUN apt-get update && apt-get install -y libcurl3-dev && docker-php-ext-install curl

# Update the default apache site with the config we created.
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# RUN mkdir -p /var/www/site && \
#     echo "Hello from /var/www/site/index.html" > /var/www/site/index.html

# Expose apache.
EXPOSE 80

VOLUME /var/www/site

CMD [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
