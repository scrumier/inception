#!/bin/sh

set -e # Stop the script if any command fails

echo "Starting MySQL..."
mysqld_safe --datadir=/var/lib/mysql &
sleep 5

echo "Creating database if not exists..."
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" || { echo "Failed to create database"; exit 1; }

echo "Creating user if not exists..."
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" || { echo "Failed to create user"; exit 1; }

echo "Granting privileges..."
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" || { echo "Failed to grant privileges"; exit 1; }

echo "Updating root password..."
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" || { echo "Failed to set root password"; exit 1; }

echo "Flushing privileges..."
mysql -e "FLUSH PRIVILEGES;" || { echo "Failed to flush privileges"; exit 1; }

echo "Shutting down MySQL..."
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown || { echo "Failed to shut down"; exit 1; }

echo "Restarting MySQL..."
exec mysqld_safe
