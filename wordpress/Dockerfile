# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/18 10:20:01 by btammara          #+#    #+#              #
#    Updated: 2021/02/19 14:11:11 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

# UPDATE & UPGARDE PACKAGES & INSTALL VIM
RUN apk update && apk upgrade

# INSTALL VIM
RUN apk add vim

# INSTALL WGET, NGINX, SUPERVISOR, MARIADB, PHP
RUN apk add wget nginx supervisor
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf
RUN apk add openrc --no-cache
RUN  apk add mariadb mariadb-client
COPY ./wordpress.sql /var/www/html
RUN apk add --no-cache mariadb
RUN mkdir -p /auth_pam_tool_dir/auth_pam_tool
RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
RUN mkdir /var/run/mysqld && mkfifo /var/run/mysqld/mysqld.sock && chown -R mysql /var/run/mysqld
# 0RUN apk add --no-cache php7-fpm php7-common php7-mysql php7-gmp php7-curl php7-intl php7-mbstring php7-xmlrpc php7-gd php7-xml php7-cli php7-zip php7-soap php7-imap
RUN apk add --no-cache php7 php7-fpm php7-common php7-gmp php7-curl php7-intl php7-mbstring php7-xmlrpc php7-gd php7-xml php7-cli php7-zip php7-soap php7-imap php7-mysqli php7-json php7-zlib php7-session

# INSTALL WORDPRESS
RUN rm /var/www/html
RUN mkdir -p /var/www/html
WORKDIR /var/www/html/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
COPY ./wp-config.php /var/www/html

EXPOSE 5050

COPY ./wordpress.sh ./
RUN chmod +x wordpress.sh
RUN mkdir -p /run/nginx
RUN chown -R root:root wordpress
# RUN /usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
CMD sh ./wordpress.sh

#apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom