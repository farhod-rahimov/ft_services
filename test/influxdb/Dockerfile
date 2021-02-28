# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 17:27:06 by btammara          #+#    #+#              #
#    Updated: 2021/02/28 11:00:29 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

# UPDATE & UPGARDE PACKAGES & INSTALL OPENRC, VIM, SUPERVISOR
RUN apk update && apk upgrade && apk add --no-cache openrc && apk add vim && apk add supervisor
COPY ./supervisord.conf /etc/supervisord.conf
# RUN apk add php7 php7-fpm  php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-opcache
# RUN apk add php7 php7-gd php7-zlib php7-curl php7-mbstring php7-opcache
# RUN apk add php7-fpm php7-mysqli php7-xml php7-simplexml php7-json php7-iconv php7-tokenizer php7-xmlwriter php7-session php7-mbstring
# php7-common php7-gmp php7-curl php7-intl php7-xmlrpc php7-gd php7-cli php7-zip php7-soap php7-imap

# # INSTALL GRAFANA
# WORKDIR /var/www/html/
# RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.7.linux-amd64.tar.gz
# RUN tar -zxvf grafana-enterprise-7.3.7.linux-amd64.tar.gz && rm grafana-enterprise-7.3.7.linux-amd64.tar.gz

# INSTALL INFLUXDB
WORKDIR /var/www/html/
RUN apk add influxdb

# INSTALL TELEGRAF
COPY ./telegraf-1.17.3_linux_amd64.tar.gz ./
RUN tar -zxvf telegraf-1.17.3_linux_amd64.tar.gz && rm telegraf-1.17.3_linux_amd64.tar.gz 
RUN mkdir /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/

# # INSTALL GLIBC
# RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
# RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
# RUN apk add glibc-2.33-r0.apk
# COPY ./config.inc.php phpmyadmin
# COPY ./www.conf /etc/php7/php-fpm.d/ 

# INSTALL FTPS
# RUN apk add vsftpd openssl
# COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
# COPY ./wp-config.php /var/www/html/

# ISSUE SELFSIGNED SSL CERTIFICATE
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/ST=Republic of Tatarstan/L=Kazan/O=21school/CN=www.localhost' -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem

# ADD NEW USER
# RUN adduser -D user
# RUN echo -e "123456789*\n123456789*" | passwd user
# RUN echo -e "123456789*\n123456789*" | passwd root

EXPOSE 8086

COPY ./influx.sh ./
RUN chmod +x influx.sh
CMD ./influx.sh
# ENTRYPOINT [ "sh", "cd ./grafana-7.3.7/bin && ./grafana-server"]
