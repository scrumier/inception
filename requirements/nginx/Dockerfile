FROM debian:latest

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y nginx \
    && apt-get clean

COPY default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
