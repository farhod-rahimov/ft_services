# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 17:27:06 by btammara          #+#    #+#              #
#    Updated: 2021/02/20 15:48:22 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

# UPDATE & UPGARDE PACKAGES & INSTALL VIM
RUN apk update && apk upgrade && apk add --no-cache openrc
# RUN apk add php7 php7-fpm  php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-opcache
# RUN apk add php7 php7-gd php7-zlib php7-curl php7-mbstring php7-opcache
RUN apk add php7-fpm php7-mysqli php7-xml php7-simplexml php7-json php7-iconv php7-tokenizer php7-xmlwriter php7-session

# INSTALL VIM
RUN apk add vim

# INSTALL NGINX, SUPERVISOR
RUN apk add nginx openssl supervisor
RUN mkdir -p /run/nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf

# INSTALL PHP MY ADMIN
WORKDIR /var/www/html/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0-rc2/phpMyAdmin-5.1.0-rc2-english.tar.gz
RUN tar -xf phpMyAdmin-5.1.0-rc2-english.tar.gz && rm -rf phpMyAdmin-5.1.0-rc2-english.tar.gz
RUN mv phpMyAdmin-5.1.0-rc2-english phpmyadmin
COPY ./config.inc.php phpmyadmin

# COPY ./www.conf /etc/php7/php-fpm.d/
# RUN mkdir -p /run/php
# RUN mkfifo /run/php/php7.3-fpm.sock
# RUN chmod 777 /run/php/php7.3-fpm.sock
RUN mkdir -p /etc/nginx/snippets
COPY ./fastcgi-php.conf /etc/nginx/snippets/fastcgi-php.conf

# ISSUE SELFSIGNED SSL CERTIFICATE
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/ST=Republic of Tatarstan/L=Kazan/O=21school/CN=www.localhost' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

# ADD NEW USER
RUN adduser -D user
RUN echo -e "123456789*\n123456789*" | passwd user
RUN echo -e "123456789*\n123456789*" | passwd root

EXPOSE 5000

COPY ./phpmyadmin.sh ./
RUN chmod +x phpmyadmin.sh
CMD ./phpmyadmin.sh
