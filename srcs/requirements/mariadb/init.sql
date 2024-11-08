service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';"

mysql -e "ALTER USER 'root'@'%' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"

mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p"${DB_ROOT_PASSWORD}" shutdown
