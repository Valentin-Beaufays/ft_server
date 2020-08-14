# ft_server
ft_server project from school 42

## Subject
Create a Dockerfile to setup a server 

## Technos
* Docker
* Nginx
* PHP
* Wordpress
* MySQL
* phpMyAdmin

## Setup

If you want, you can disable the auto index of the files by changing the ```env auto_index``` to false

Run:

```docker build -t ft_server .```

```docker run -d -p 80:80 -p 443:443 -n fs ft_server```

You can disable the auto index of the files by changing the ```env auto_index``` to false

## Warning
* because of the self-generated ssl certificate some browsers can blacklist the pages
* To be able to display the wordpress and the phpmyadmin you must access them with their respective domain (wordpress.be and phpmyadmin.be)
I'm working on an easy way to do it locally but for now you must add these lines:

 ```127.0.0.1	phpmyadmin.be```

 ```127.0.0.1	wordpress.be```

 to your operating system's hosts file

 On Windows: 

 ```C:\Windows\System32\drivers\etc\hosts```

 On Linux:

 ```/etc/hosts```
