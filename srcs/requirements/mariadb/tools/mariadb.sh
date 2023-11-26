#!/bin/bash

service mariadb start

mysql -e "create database if not exists $DB_NAME;"
mysql -e "create user if not exists '$DB_USER'@'%' identified by '$DB_PASSWORD';"
mysql -e "grant all privileges on $DB_NAME.* TO '$DB_USER'@'%';"
mysql -e "flush privileges;"

# me da un error de acceso exclusivo a nosequé de aria log si no mato el proceso
pkill -f mysqld

mysqld
