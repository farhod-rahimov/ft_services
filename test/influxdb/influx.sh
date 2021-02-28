# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    influx.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 18:07:50 by btammara          #+#    #+#              #
#    Updated: 2021/02/28 14:29:01 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

openrc default
# rc-service influxdb start
echo "create user admin with password 'admin' with all privileges" | influx -precision rfc3339
echo "create database ftps" | influx -precision rfc3339
echo "create database grafana" | influx -precision rfc3339
echo "create database influxdb" | influx -precision rfc3339
echo "create database mysql" | influx -precision rfc3339
echo "create database nginx" | influx -precision rfc3339
echo "create database phpmyadmin" | influx -precision rfc3339
echo "create database wordpress" | influx -precision rfc3339
# rc-service influxdb stop
# rc-service influxdb stop
# sh -c "./grafana-7.3.7/bin/grafana-server"
# vsftpd /etc/vsftpd/vsftpd.conf
# mysql_install_db
# rc-service mariadb start
# mysql < ./new_db.sql
# mysql wordpress < ./wordpress.sql

# rc-service mariadb restart
# rc-service nginx start
# rc-service php-fpm7 start
# rc-service php-fpm7 stop

# influxd
# tail -F /dev/null
# rc-service mariadb stop

/usr/bin/supervisord -c /etc/supervisord.conf

# sh