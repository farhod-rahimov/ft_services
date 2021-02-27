# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ftps.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 18:07:50 by btammara          #+#    #+#              #
#    Updated: 2021/02/26 16:20:56 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

openrc default
# mysql_install_db
# rc-service mariadb start
# mysql < ./new_db.sql
# mysql wordpress < ./wordpress.sql

# rc-service mariadb restart
# rc-service nginx start
# rc-service php-fpm7 start
# rc-service php-fpm7 stop

# rc-service mariadb stop

tail -F /dev/null

# /usr/bin/supervisord -c /etc/supervisord.conf

# sh