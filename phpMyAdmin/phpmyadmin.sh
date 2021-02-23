# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    phpmyadmin.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 18:07:50 by btammara          #+#    #+#              #
#    Updated: 2021/02/23 10:25:47 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

openrc default
mysql_install_db
rc-service mariadb start
mysql < /new_db.sql

echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost' identified by 'admin' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password

rc-service mariadb restart
rc-service nginx start
rc-service php-fpm7 start

# /usr/bin/supervisord -c /etc/supervisord.conf

sh