FROM alpine:3.23

RUN apk update && apk add nginx \
	openssl

RUN mkdir /cert && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-out /cert/pub_cert.crt -keyout /cert/prv_key.key \
	-subj "/C=AT/ST=Vienna/L=Vienna/O=42vienna/OU=42vienna/CN=ejakob.42.fr"

COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
