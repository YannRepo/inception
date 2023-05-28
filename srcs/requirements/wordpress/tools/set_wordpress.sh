#!/bin/bash

echo "Waiting 10 seconds to let mariadb start..."
sleep 10

# Creation of runtime folder if not existing
if [ ! -d "/run/php" ]; then
	mkdir -p /run/php
	touch /run/php/php7.3-fpm.pid
fi

# Download wordpress. If wp-config-sample.php exists, WP has already been installed
if [ ! -f "wp-config-sample.php" ]; then
	wp core download --allow-root
fi

# Wordpress installation and add user (root and user). if wp-config.php exists, WP has already been installed
if [ ! -f "wp-config.php" ]; then
	wp config create --dbname=wordpress --dbuser=$SQL_USERNAME --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/html' --allow-root
	wp core install --url="ybellot.42.fr" --title="my_inception_website" --admin_user=$WP_ADMIN_USERNAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
	wp user create $WP_USERNAME $WP_EMAIL --user_pass=$WP_PASSWORD --allow-root
fi

echo "Container now running php-fpm."
/usr/sbin/php-fpm7.3 -F -R
