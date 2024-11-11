#!/bin/sh

# Initialize the MariaDB data directory if it doesn’t exist
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Start MariaDB server in the background
mysqld_safe --datadir='/var/lib/mysql' &

# Wait for MariaDB to fully start
until mysqladmin ping -h "localhost" --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 2
done

# Check if the database exists
if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
    echo "Creating database and user..."

    # Secure the MariaDB installation by setting root password and other configurations
    mysql -uroot <<EOSQL
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
FLUSH PRIVILEGES;
EOSQL

    # Create database and user for WordPress
    mysql -uroot -p${DB_ROOT_PASSWORD} <<EOSQL
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOSQL

    echo "Database and user created."
else
    echo "Database already exists."
fi

# Stop the MariaDB server gracefully
mysqladmin -uroot -p${DB_ROOT_PASSWORD} shutdown

# Start MariaDB in the foreground
exec mysqld_safe --datadir='/var/lib/mysql'
