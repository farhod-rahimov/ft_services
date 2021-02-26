# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 17:27:06 by btammara          #+#    #+#              #
#    Updated: 2021/02/18 09:47:26 by btammara         ###   ########.fr        #
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
