FROM debian:buster

ENV pma_filename phpMyAdmin-5.0.2-all-languages
ENV wP_filename wordpress-5.4.2-fr_FR

# Install and update tools
RUN apt-get update
RUN apt-get install -y nginx mariadb-server php7.3 php7.3-fpm php7.3-mysql php-json php-mbstring

# Install phpMyAdmin
ADD ./srcs/phpMyAdmin.conf ./etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/phpMyAdmin.conf ./etc/nginx/sites-enabled/
ADD ./srcs/${pma_filename}.tar.gz ./var/www/
RUN mv ./var/www/${pma_filename}/ ./var/www/phpMyAdmin/
ADD ./srcs/config.inc.php ./var/www/phpMyAdmin/

# Install wordpress
ADD ./srcs/wordpress.conf ./etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/wordpress.conf ./etc/nginx/sites-enabled/
ADD ./srcs/${wP_filename}.tar.gz ./var/www/
ADD ./srcs/wp-config.php ./var/www/wordpress/

ADD ./srcs/start.sh ./
CMD ./start.sh

EXPOSE 80