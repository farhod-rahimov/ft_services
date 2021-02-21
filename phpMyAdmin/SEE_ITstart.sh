#!/bin/sh

openrc default
mysql_install_db
rc-service mariadb start
mysql < /new_db.sql
mysql wordpress < /mysql-svc.sql
rc-service mariadb stop
exec /usr/bin/mysqld_safe