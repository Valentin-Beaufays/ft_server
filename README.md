# ft_server
ft_server project from school 42

## Subject
Setup a webserver using Docker

## Technos
* Docker
* Nginx
* PHP
* Wordpress
* MySQL
* phpMyAdmin

## Setup

If you want, you can disable the auto index of the files by changing the ```env auto_index``` to false in the Dockerfile

Run:

```docker build -t ft_server .```

```docker run -d -p 80:80 -p 443:443 --name fs ft_server```

You can disable the auto index of the files by changing the ```env auto_index``` to false

run ```docker rm --force fs``` to stop and delete the container

## Use

You can access the wordpress using [localhost](http://localhost) and phpMyAdmin with [localhost/phpmyadmin](http://localhost/phpmyadmin)

## Warning
* because of the self-generated ssl certificate some browsers can blacklist the pages and show a warning
* Make sure that you are using Unix style line break (LF)
