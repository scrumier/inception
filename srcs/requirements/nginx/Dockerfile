FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install -y nginx \
    vim \
    curl \
    openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Lyon/O=42/OU=42/CN=scrumier.42.fr/UID=scrumier"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl
