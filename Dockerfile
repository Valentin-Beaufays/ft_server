FROM debian:buster

ENV pma_filename phpMyAdmin-5.0.2-all-languages
ENV wP_filename wordpress-5.4.2-fr_FR

# Install and update tools
RUN apt-get update
RUN apt-get install -y nginx mariadb-server php7.3 php7.3-fpm php7.3-mysql php-json php-mbstring openssl

# Install phpMyAdmin
ADD ./srcs/phpMyAdmin.conf ./etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/phpMyAdmin.conf ./etc/nginx/sites-enabled/
ADD ./srcs/${pma_filename}.tar.gz ./var/www/
RUN mv ./var/www/${pma_filename}/ ./var/www/phpMyAdmin/
ADD ./srcs/config.inc.php ./var/www/phpMyAdmin/
RUN mkdir ./etc/nginx/ssl/ && mkdir ./etc/nginx/ssl/phpMyAdmin
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/phpMyAdmin/phpMyAdmin.pem \
    -keyout /etc/nginx/ssl/phpMyAdmin/phpMyAdmin.key -subj "/C=BE/ST=Bruxelles/L=bruxelles/O=19/CN=vbeaufay"

# Install wordpress
ADD ./srcs/wordpress.conf ./etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/wordpress.conf ./etc/nginx/sites-enabled/
ADD ./srcs/${wP_filename}.tar.gz ./var/www/
ADD ./srcs/wp-config.php ./var/www/wordpress/
RUN mkdir ./etc/nginx/ssl/wordpress
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/wordpress/wordpress.pem \
    -keyout /etc/nginx/ssl/wordpress/wordpress.key -subj "/C=BE/ST=Bruxelles/L=bruxelles/O=19/CN=vbeaufay"

ADD ./srcs/start.sh ./
CMD ./start.sh

EXPOSE 80