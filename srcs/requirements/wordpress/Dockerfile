FROM debian:oldstable

ARG DB_USER
ARG DB_PASSWORD
ARG DB_NAME
ARG DB_HOST
ARG WP_URL
ARG WP_ADMIN
ARG WP_ADMIN_PASSWORD
ARG WP_ADMIN_EMAIL

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    php-fpm \
    php-mysql \
    netcat \
    curl \
    && apt-get clean

COPY www.conf /etc/php/7.3/fpm/pool.d/.
COPY script.sh .

RUN chmod +x script.sh

EXPOSE 9000

CMD ["./script.sh"]