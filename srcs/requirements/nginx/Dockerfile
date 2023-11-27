FROM alpine:3.17

RUN apk update && apk add nginx openssl

COPY tools/nginx.sh /nginx.sh
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

RUN /nginx.sh

RUN chmod -R 755 /var/www/html && chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
