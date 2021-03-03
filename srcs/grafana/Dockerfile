# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 17:27:06 by btammara          #+#    #+#              #
#    Updated: 2021/03/03 10:24:27 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

# UPDATE & UPGARDE PACKAGES & INSTALL OPENRC, VIM, SUPERVISOR
RUN apk update && apk upgrade && apk add --no-cache openrc && apk add vim && apk add supervisor
COPY ./supervisord.conf /etc/supervisord.conf

# INSTALL GRAFANA
WORKDIR /var/www/html/
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.7.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.3.7.linux-amd64.tar.gz && rm grafana-enterprise-7.3.7.linux-amd64.tar.gz
COPY ./data/* /var/www/html/grafana-7.3.7/data/

# INSTALL GLIBC
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
RUN apk add glibc-2.33-r0.apk

# INSTALL TELEGRAF
COPY ./telegraf-1.17.3_linux_amd64.tar.gz ./
RUN tar -zxvf telegraf-1.17.3_linux_amd64.tar.gz && rm telegraf-1.17.3_linux_amd64.tar.gz 
RUN mkdir /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/

EXPOSE 3000

COPY ./grafana.sh ./
RUN chmod +x grafana.sh
CMD ./grafana.sh
