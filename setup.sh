# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/03 10:52:27 by btammara          #+#    #+#              #
#    Updated: 2021/03/03 13:17:57 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# MINIKUBE START
minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
minikube addons enable metallb
eval $(minikube docker-env)

# APLLY CONFIGMAP
kubectl apply -f ./srcs/metallb/configmap.yaml

# BUILD MYSQL
docker build -t mysql_image ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

# BUILD PHPMYADMIN
docker build -t phpmyadmin_image ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

# BUILD WORDPRESS
docker build -t wordpress_image ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml

# BUILD NGINX
docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

# BUILD FTPS
docker build -t ftps_image ./srcs/ftps
kubectl apply -f ./srcs/ftps/ftps.yaml

# BUILD GRAFANA
docker build -t grafana_image ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml

# BUILD INFLUXDB
docker build -t influxdb_image ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml

# LAUNCH MINIKUBE DASHBOARD
minikube dashboard
