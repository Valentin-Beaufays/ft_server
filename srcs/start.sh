#!/bin/bash

./etc/init.d/mysql start

#setup phpMyAdmin
mysql < /var/www/phpmyadmin/sql/create_tables.sql -u root
echo "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass';'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#setup wordpress
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'azerty';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#start services
./etc/init.d/php7.3-fpm start
./etc/init.d/mysql restart
nginx -g 'daemon off;'
