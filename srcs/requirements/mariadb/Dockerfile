FROM debian:oldstable

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /tools/mariadb/
COPY ./tools/setup-db.sh /tools/mariadb/setup-db.sh

RUN chmod +x /tools/mariadb/setup-db.sh

CMD /tools/mariadb/setup-db.sh
