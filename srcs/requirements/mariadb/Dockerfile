FROM alpine:3.23

RUN apk update && apk add mariadb \
	mariadb-client

RUN sed -i "s/skip-network/#skip-network/" /etc/my.cnf.d/mariadb-server.cnf && \
		sed -i "s/#bind-address=0.0.0.0/bind-address=0.0.0.0/" /etc/my.cnf.d/mariadb-server.cnf

COPY tools/entrypoint.sh entrypoint.sh

EXPOSE 3306

# USER mysql
CMD ["/bin/sh", "entrypoint.sh"]
