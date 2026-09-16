FROM alpine:3.23

RUN apk update && apk add mariadb \
	mariadb-client

COPY entrypoint.sh entrypoint.sh

EXPOSE 3306

# USER mysql
CMD ["/bin/sh", "entrypoint.sh"]
