#!/bin/bash

set -x

sleep 10

echo "Starting WordPress setup..."
if [ ! -f "./wp-config.php" ]; then
    echo "Installing WordPress..."
    echo "DB_USER: $DB_USER"
    echo "DB_PASSWORD: $DB_PASSWORD"
    echo "DB_HOST: $DB_HOST"
    echo "DB_NAME: $DB_NAME"
    wget http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mv wordpress/* .
    rm -rf latest.tar.gz
    rm -rf wordpress

    # Update wp-config.php with correct database details
    sed -i "s/database_name_here/$DB_NAME/" wp-config-sample.php
    sed -i "s/username_here/$DB_USER/" wp-config-sample.php
    sed -i "s/password_here/$DB_PASSWORD/" wp-config-sample.php
    sed -i "s/localhost/$DB_HOST/" wp-config-sample.php

    cp wp-config-sample.php wp-config.php
else
    echo "WordPress already installed"
fi
