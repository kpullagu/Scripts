#!/bin/bash


echo "Running LAMP Script for Centos 7.2! on BMC Image"

echo "*********** Change Firewall to allow HTTP and HTTPS traffic**********"
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

echo "*********** Update Packages **********"
sudo yum -y update

echo "*********** Install Apache, MySQL (MariaDB), PHP and PHP Modules Packages **********"
sudo yum -y install httpd mariadb-server mariadb php php-pear php-mysql
echo "*********** Start Apache Service and enable it to start on boot. Start MySQL (MariaDB) and enable it to start on boot**********"
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo systemctl restart httpd.service
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service
sudo systemctl restart httpd.service


