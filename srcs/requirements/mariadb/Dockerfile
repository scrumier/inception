FROM debian:oldstable

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD
ARG WP_URL

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    mariadb-client \
    mariadb-server \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

EXPOSE 3306

#COPY		./conf/mysqld.conf ~/my.cnf
#COPY		./conf/mysqld.conf /etc/mysql/my.cnf
COPY		./conf/mysqld.conf /etc/my.cnf


COPY ./tools/mariadb.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]