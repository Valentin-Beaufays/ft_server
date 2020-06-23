#!/bin/bash

./etc/init.d/php7.3-fpm start
./etc/init.d/mysql start
nginx -g 'daemon off;'
