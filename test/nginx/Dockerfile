# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 17:27:06 by btammara          #+#    #+#              #
#    Updated: 2021/02/28 14:38:11 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

# UPDATE & UPGARDE PACKAGES & INSTALL VIM
RUN apk update && apk upgrade

# INSTALL VIM
RUN apk add vim

# INSTALL NGINX, SSH AND SUPERVISOR
RUN apk add nginx openssl supervisor
RUN apk add openssh
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf

# INSTALL TELEGRAF
WORKDIR /var/www/html/
COPY ./telegraf-1.17.3_linux_amd64.tar.gz ./
RUN tar -zxvf telegraf-1.17.3_linux_amd64.tar.gz && rm telegraf-1.17.3_linux_amd64.tar.gz 
RUN mkdir /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/

# INSTALL GLIBC
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
RUN apk add glibc-2.33-r0.apk

# ISSUE SELFSIGNED SSL CERTIFICATE
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/ST=Republic of Tatarstan/L=Kazan/O=21school/CN=www.localhost' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

# ADD NEW USER
RUN adduser -D user
RUN echo -e "123456789*\n123456789*" | passwd user
RUN echo -e "123456789*\n123456789*" | passwd root

EXPOSE 80 443 22

COPY ./nginx.sh ./
RUN chmod +x nginx.sh
RUN mkdir -p /run/nginx
CMD ./nginx.sh
