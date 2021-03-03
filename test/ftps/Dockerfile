# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 17:27:06 by btammara          #+#    #+#              #
#    Updated: 2021/03/03 10:31:52 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

# UPDATE & UPGARDE PACKAGES & INSTALL OPENRC, VIM, WGET
RUN apk update && apk upgrade && apk add --no-cache openrc && apk add vim && apk add wget

# INSTALL OPENSSL, SUPERVISOR
RUN apk add openssl supervisor
COPY ./supervisord.conf /etc/supervisord.conf

# INSTALL FTPS
WORKDIR /var/www/html/
RUN apk add vsftpd openssl
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

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
