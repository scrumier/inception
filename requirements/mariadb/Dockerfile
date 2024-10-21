FROM debian:latest

RUN apt-get update && apt-get install -y mariadb-server \
    && apt-get clean

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /docker-entrypoint-initdb.d/init.sql
COPY script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

CMD ["/usr/local/bin/script.sh"]
