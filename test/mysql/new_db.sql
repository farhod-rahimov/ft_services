CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' identified by 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT