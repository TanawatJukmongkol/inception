#!/bin/sh

service mysql start

echo "Waiting for MariaDB..."
until mysql -h$DB_HOST --user=$DB_USER --password=$DB_PASSWORD -e '\c' > /dev/null;
do
    sleep 3
done
echo "MariaDB accessible!"

echo "Installing WordPress..."
wp-cli.phar core install --allow-root --path=/var/www/html/ --url="https://$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --admin_email=$WP_ADMIN_EMAIL
echo "Creating WordPress default user..."
wp-cli.phar user create $WP_USER $WP_EMAIL --allow-root --path=/var/www/html/ --role=author --user_pass=$WP_PASSWORD --display_name=$WP_USER
echo "Installing WordPress theme..."
wp-cli.phar theme install /var/www/html/vertice.1.0.20.zip --allow-root --path=/var/www/html/ --activate
chmod 777 -R /var/www/html

echo "Starting WordPress fastCGI on port 9000..."

mkdir -p  /var/run/php/
/usr/sbin/php-fpm7.3 -F -R
