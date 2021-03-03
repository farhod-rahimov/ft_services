# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    grafana.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 18:07:50 by btammara          #+#    #+#              #
#    Updated: 2021/03/03 10:32:34 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

cd /var/www/html/grafana-7.3.7/bin
/usr/bin/supervisord -c /etc/supervisord.conf