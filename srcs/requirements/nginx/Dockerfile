FROM debian:oldstable

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    nginx \
    openssl \
    && apt-get clean

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/scrumier.crt \
        -keyout /etc/nginx/ssl/scrumier.key \
        -subj "/C=FR/ST=IDF/L=Lyon/O=42/OU=42/CN=scrumier.42.fr/UID=scrumier"

COPY ./conf/nginx.conf /etc/nginx/conf.d/.

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
