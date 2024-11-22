FROM debian:oldstable

# Update and install necessary packages
RUN apt-get update -y && apt-get upgrade -y

RUN apt-get -y install wget

RUN apt-get install -y php7.4 \
    php-fpm \
    php-mysql \
    mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php
RUN chown -R www-data:www-data /run/php

RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www

COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chown www-data:www-data /etc/php/7.4/fpm/pool.d/www.conf

CMD ["/usr/sbin/php-fpm7.4", "-F"]
