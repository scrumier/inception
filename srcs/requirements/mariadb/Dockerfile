FROM debian:oldstable

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD
ARG WP_URL

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    mariadb-client \
    mariadb-server \
    && apt-get clean

# Copy configuration files and script
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/.
COPY script.sh .

# Create required directories and set proper ownership
RUN mkdir -p /run/mysqld /var/lib/mysql \
    && chown -R mysql:mysql /run/mysqld \
    && chmod +x script.sh

# Expose the MySQL port
EXPOSE 3306

# Run the script
CMD ["./script.sh"]
