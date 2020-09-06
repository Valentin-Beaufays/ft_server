FROM debian:buster

ENV pma_filename phpMyAdmin-5.0.2-all-languages
ENV wP_filename wordpress-5.4.2-fr_FR
ENV auto_index true

# Install and update tools
RUN apt-get update
RUN apt-get install -y nginx mariadb-server php7.3 php7.3-fpm php7.3-mysql php-json php-mbstring openssl

#config index
ADD ./srcs/nginx.conf ./
RUN if [ "${auto_index}" = "true" ] ; then rm etc/nginx/nginx.conf && mv ./nginx.conf ./etc/nginx/ ; else rm nginx.conf ; fi

# Install wordpress
RUN rm ./etc/nginx/sites-available/default ./etc/nginx/sites-enabled/default
ADD ./srcs/wordpress.conf ./etc/nginx/sites-available/
RUN mv ./etc/nginx/sites-available/wordpress.conf ./etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/default ./etc/nginx/sites-enabled/
ADD ./srcs/${wP_filename}.tar.gz ./var/www/
ADD ./srcs/wp-config.php ./var/www/wordpress/
RUN mkdir ./etc/nginx/ssl && mkdir ./etc/nginx/ssl/wordpress
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/wordpress/wordpress.pem \
    -keyout /etc/nginx/ssl/wordpress/wordpress.key -subj "/C=BE/ST=Bruxelles/L=bruxelles/O=19/CN=vbeaufay"

# Install phpMyAdmin
ADD ./srcs/${pma_filename}.tar.gz ./var/www/wordpress
RUN mv ./var/www/wordpress/${pma_filename}/ ./var/www/wordpress/phpmyadmin/
ADD ./srcs/config.inc.php ./var/www/wordpress/phpmyadmin/

ADD ./srcs/start.sh ./
CMD ./start.sh

EXPOSE 80
EXPOSE 443