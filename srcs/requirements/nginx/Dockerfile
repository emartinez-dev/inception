FROM alpine:3.17

RUN apk update && apk add nginx openssl

COPY tools/nginx.sh /nginx.sh
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

RUN /nginx.sh

# run nginx without halting and without & commands or anything strange:
# https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting

CMD ["nginx", "-g", "daemon off;"]
