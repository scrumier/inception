FROM debian:latest

RUN apt-get update && apt-get install -y \
    mariadb-server \
    && apt-get clean

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/.
COPY script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

CMD ["./script.sh"]
