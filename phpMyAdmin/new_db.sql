CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';  
GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' WITH GRANT OPTION;  
FLUSH PRIVILEGES;
EXIT