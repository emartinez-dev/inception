#!/bin/ash

#https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-ubuntu-20-04-with-a-lamp-stack

WORDPRESS_FOLDER="/var/www/html"
CONFIG_FILE="$WORDPRESS_FOLDER/wp-config.php"

cd /tmp && wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz
mkdir -p /tmp/wordpress/wp-content/upgrade
cp -a /tmp/wordpress/. $WORDPRESS_FOLDER

# Setup permissions
find $WORDPRESS_FOLDER -type d -exec chmod 750 {} \;
find $WORDPRESS_FOLDER -type f -exec chmod 640 {} \;

wget -qO - https://api.wordpress.org/secret-key/1.1/salt/ > $CONFIG_FILE

cat << EOF
define( 'DB_NAME', '$DB_NAME' );
define( 'DB_USER', '$DB_USER' );
define( 'DB_PASSWORD', '$DB_PASSWORD' );
define( 'DB_HOST', 'franmart.42.fr' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define( 'FS_METHOD', 'direct');
EOF >> $CONFIG_FILE
php-fpm81
