#!/bin/sh

# Wait for the MariaDB service to be ready
sleep 10

# Check if wp-config.php exists, and create it if necessary
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "wp-config.php not found. Creating wp-config.php with the provided database settings."

    wp config create --allow-root \
                     --dbname=$WORDPRESS_DB_NAME \
                     --dbuser=$WORDPRESS_DB_USER \
                     --dbpass=$WORDPRESS_DB_PASSWORD \
                     --dbhost=$WORDPRESS_DB_HOST \
                     --path='/var/www/wordpress'
else
    echo "wp-config.php already exists. Skipping WordPress configuration."
fi
