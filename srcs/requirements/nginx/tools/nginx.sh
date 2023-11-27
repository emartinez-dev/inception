#!/bin/ash

# Reference:
# https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=ES/ST=Málaga/L=Málaga/O=42Malaga/OU=42Malaga/CN=franmart.42.fr"
