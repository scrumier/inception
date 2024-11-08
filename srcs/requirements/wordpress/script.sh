#!/bin/bash
if [ ! -d /var/www/html ]; then
    mkdir -p /var/www/html
fi

echo "DB_HOST: $DB_HOST"

if [ ! -f "/var/www/html/wp-config.php" ]; then
    cd /var/www/html
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    ./wp-cli.phar core download --allow-root
    ./wp-cli.phar config create --allow-root \
                                --dbname=$DB_NAME \
                                --dbuser=$DB_USER \
                                --dbpass=$DB_PASSWORD \
                                --dbhost=$DB_HOST:3306
    ./wp-cli.phar db create --allow-root
                                
    ./wp-cli.phar core install  --allow-root \
                                --url=$WP_URL \
                                --title=Scrumier \
                                --admin_user=$WP_ADMIN \
                                --admin_password=$WP_ADMIN_PASSWORD \
                                --admin_email=$WP_ADMIN_EMAIL

    php-fpm7.3 -F
fi