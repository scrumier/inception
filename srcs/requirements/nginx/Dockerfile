FROM debian:oldstable

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    nginx \
    && apt-get clean

COPY default /etc/nginx/sites-available/.

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
