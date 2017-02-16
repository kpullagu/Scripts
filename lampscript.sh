#!/bin/bash


echo "Running LAMP Script!"

echo "*********** Stop OS Firewall **********"
sudo service iptables stop

echo "*********** Install Apache, MySQL, PHP **********"
sudo yum install -y mysql mysql-server httpd php php-mysql

echo "*********** Change Permissions **********"
sudo chmod 777 -R /var/www/

#echo "*********** Create Test Web Pages **********"
#echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
#echo "<head><bold>Enterprise Cloud Computing SaaS, PaaS, IaaS | Oracle Cloud</bold></head>" > /var/www/html/index.html

echo "*********** Start MySQL and Apache **********"
sudo service mysqld start
sudo service httpd start

