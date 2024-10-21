FROM debian:latest

RUN apt-get update && apt-get install -y \
    php8.2-fpm \
    php8.2-mysqli \
    curl \
    && apt-get clean

COPY www.conf /etc/php/8.2/fpm/pool.d/.
COPY script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]