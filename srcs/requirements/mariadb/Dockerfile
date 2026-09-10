FROM alpine:3.23

RUN apk update && apk add mariadb \
	mariadb-client

COPY tools/entrypoint.sh entrypoint.sh

CMD ["/bin/sh", "entrypoint.sh"]
