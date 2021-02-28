# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    grafana.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 18:07:50 by btammara          #+#    #+#              #
#    Updated: 2021/02/28 09:48:14 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# openrc default
# rc-service influxdb start
# echo "create database mydb" | influx -precision rfc3339
# echo "create user admin with password 'admin' with all privileges" | influx -precision rfc3339

# rc-service mariadb restart
# rc-service nginx start
# rc-service php-fpm7 start
# rc-service php-fpm7 stop

# tail -F /dev/null

cd /var/www/html/grafana-7.3.7/bin
./grafana-server
# /usr/bin/supervisord -c /etc/supervisord.conf

# sh
