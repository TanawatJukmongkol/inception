FROM alpine:3.19.1

RUN apk add nginx openssl

ARG		DOMAIN_NAME
ARG		CERTS_
ARG		KEYS_

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/nginx-selfsigned.crt \
	-keyout /etc/nginx/ssl/nginx-selfsigned.key \
	-subj "/C=TH/ST=Bangkok/L=Bangkok/O=42/OU=tjukmong/CN="${DOMAIN_NAME}"/"

COPY	tools/config.sh /usr/local/bin
RUN		chmod +x /usr/local/bin/config.sh

EXPOSE		443

CMD	[ "config.sh" ]