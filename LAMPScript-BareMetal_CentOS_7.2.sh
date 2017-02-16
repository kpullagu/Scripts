#!/bin/bash


echo "Running LAMP Script for Centos 7.2!"

echo "*********** Change Firewall to allow HTTP and HTTPS traffic**********"
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload
echo "*********** Update Packages **********"
sudo yum update

echo "*********** Install Apache Packages **********"
sudo yum install httpd
echo "*********** Start Apache Service and enable it to start on boot **********"
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo systemctl restart httpd.service

echo "*********** Install MySQL (MariaDB) Packages. MariaDB is replacing MySQL and its the fork of MySQL**********"
sudo yum install mariadb-server mariadb
echo "*********** Start MySQL (MariaDB) Service and enable it to start on boot **********"
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

echo "*********** Install PHP and PHP Modules **********"
sudo yum install php php-pear
sudo yum install php-mysql

sudo systemctl restart httpd.service
