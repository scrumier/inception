#!/bin/bash
cd /var/www/html
touch wp-config.php
echo "<?php" > wp-config.php
echo "define('DB_NAME', 'wordpress');" >> wp-config.php
echo "define('DB_USER', 'wpuser');" >> wp-config.php
echo "define('DB_PASSWORD', 'password');" >> wp-config.php
echo "define('DB_HOST', 'mariadb');" >> wp-config.php
echo "define('DB_CHARSET', 'utf8');" >> wp-config.php
echo "define('DB_COLLATE', '');" >> wp-config.php
chown www-data:www-data wp-config.php
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root
php-fpm8.2 -F