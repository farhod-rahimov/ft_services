CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost' identified by 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT