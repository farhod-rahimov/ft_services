# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wordpress.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/18 10:36:34 by btammara          #+#    #+#              #
#    Updated: 2021/02/19 14:06:06 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# rc-service wordpress start
# /usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
# /usr/bin/mysqld_safe --datadir="/var/lib/mysql"

# echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
# echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
# echo "UPDATE mysql.user set plugin='' where user='root';"| mysql -u root --skip-password

echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "UPDATE mysql.user set plugin='' where user='root';"| mysql -u root --skip-password
mysql -u root -p wordpress --skip-password < wordpress.sql

/usr/bin/supervisord -c /etc/supervisord.conf