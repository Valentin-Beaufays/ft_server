#!/bin/bash

./etc/init.d/mysql start

#setup phpMyAdmin
mysql < /var/www/wordpress/phpmyadmin/sql/create_tables.sql -u root
echo "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#setup wordpress
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'admin';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#setup root user
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpass';" | mysql -u root

#start services
./etc/init.d/php7.3-fpm start
nginx -g 'daemon off;'
