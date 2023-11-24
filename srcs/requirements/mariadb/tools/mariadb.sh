#!/bin/bash

# TODO: remove this, it will be read from .env
DB_NAME="wordpress"
DB_USER="inception"
DB_PASSWORD="01923lkasdfjals"

service mariadb start

mysql -e "create database if not exists $DB_NAME;"
mysql -e "create user '$DB_USER'@'%' identified by '$DB_PASSWORD';" 
mysql -e "grant all privileges on $DB_NAME.* TO '$DB_USER'@'%';"
mysql -e "flush privileges;"
