# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 17:27:06 by btammara          #+#    #+#              #
#    Updated: 2021/03/03 11:27:59 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

# UPDATE & UPGARDE PACKAGES & INSTALL OPENRC, VIM, SUPERVISOR
RUN apk update && apk upgrade && apk add --no-cache openrc && apk add vim && apk add supervisor
COPY ./supervisord.conf /etc/supervisord.conf

# INSTALL INFLUXDB
WORKDIR /var/www/html/
RUN apk add influxdb
RUN mkdir -p /var/lib/influxdb/meta
RUN mkdir -p /var/lib/influxdb/wal
RUN mkdir -p /var/lib/influxdb/data

# INSTALL TELEGRAF
COPY ./telegraf-1.17.3_linux_amd64.tar.gz ./
RUN tar -zxvf telegraf-1.17.3_linux_amd64.tar.gz && rm telegraf-1.17.3_linux_amd64.tar.gz 
RUN mkdir /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/

# INSTALL GLIBC
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
RUN apk add glibc-2.33-r0.apk

EXPOSE 8086

COPY ./influx.sh ./
RUN chmod +x influx.sh
CMD ./influx.sh
