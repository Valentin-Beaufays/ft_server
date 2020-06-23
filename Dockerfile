FROM debian:buster

ENV pma_filename phpMyAdmin-5.0.2-all-languages

ENV wP_filename wordpress-5.4.2-fr_FR

RUN apt-get update

RUN apt-get install -y nginx mariadb-server php7.3 php7.3-fpm php7.3-mysql unzip

ADD srcs/phpmyadmin.conf ./etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/phpmyadmin.conf /etc/nginx/sites-enabled/

ADD srcs/wordpress.conf ./etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

ADD srcs/${pma_filename}.tar.gz ./var/www/

RUN mv ./var/www/${pma_filename}/ ./var/www/phpmyadmin/

ADD srcs/${wP_filename}.tar.gz ./var/www/

ADD srcs/start.sh ./

CMD ./start.sh

EXPOSE 80