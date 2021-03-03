# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 17:27:06 by btammara          #+#    #+#              #
#    Updated: 2021/03/03 09:44:03 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

# UPDATE & UPGARDE PACKAGES & INSTALL OPENRC, VIM
RUN apk update && apk upgrade && apk add --no-cache openrc && apk add vim && apk add wget
# RUN apk add php7 php7-fpm  php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-opcache
# RUN apk add php7 php7-gd php7-zlib php7-curl php7-mbstring php7-opcache
# RUN apk add php7-fpm php7-mysqli php7-xml php7-simplexml php7-json php7-iconv php7-tokenizer php7-xmlwriter php7-session php7-mbstring
# php7-common php7-gmp php7-curl php7-intl php7-xmlrpc php7-gd php7-cli php7-zip php7-soap php7-imap

# INSTALL NGINX, OPENSSL, SUPERVISOR
RUN apk add supervisor
COPY ./supervisord.conf /etc/supervisord.conf
# RUN apk add nginx openssl supervisor
# RUN mkdir -p /run/nginx
# RUN mkdir -p /etc/nginx/snippets
# COPY ./fastcgi-php.conf /etc/nginx/snippets/fastcgi-php.conf
# COPY ./nginx.conf /etc/nginx/conf.d/default.conf
# COPY ./supervisord.conf /etc/supervisord.conf

# # INSTALL PHPMYADMIN
# WORKDIR /var/www/html/
# RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0-rc2/phpMyAdmin-5.1.0-rc2-english.tar.gz
# RUN tar -xf phpMyAdmin-5.1.0-rc2-english.tar.gz && rm -rf phpMyAdmin-5.1.0-rc2-english.tar.gz
# RUN mv phpMyAdmin-5.1.0-rc2-english phpmyadmin
# COPY ./config.inc.php phpmyadmin
# # COPY ./www.conf /etc/php7/php-fpm.d/ 

# # INSTALL MYSQL
# RUN mkdir /run/mysqld
# RUN apk add --no-cache mysql mysql-client
# COPY ./my.cnf /etc/
# COPY ./new_db.sql ./
# COPY ./wordpress.sql ./

# # INSTALL WORDPRESS
# RUN wget https://wordpress.org/latest.tar.gz
# RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
# COPY ./wp-config.php /var/www/html/

# INSTALL FTPS
WORKDIR /var/www/html/
RUN apk add vsftpd openssl
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
# COPY ./wp-config.php /var/www/html/

# INSTALL GLIBC
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
RUN apk add glibc-2.33-r0.apk

# INSTALL TELEGRAF
COPY ./telegraf-1.17.3_linux_amd64.tar.gz ./
RUN tar -zxvf telegraf-1.17.3_linux_amd64.tar.gz && rm telegraf-1.17.3_linux_amd64.tar.gz 
RUN mkdir /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/

# ISSUE SELFSIGNED SSL CERTIFICATE
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/ST=Republic of Tatarstan/L=Kazan/O=21school/CN=www.localhost' -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem

# ADD NEW USER
RUN adduser -D user
RUN echo -e "123456789*\n123456789*" | passwd user
RUN echo -e "123456789*\n123456789*" | passwd root

EXPOSE 21

COPY ./ftps.sh ./
RUN chmod +x ftps.sh
CMD ./ftps.sh
