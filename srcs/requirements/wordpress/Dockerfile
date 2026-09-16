FROM alpine:3.23

RUN apk update && apk add php-fpm \
		php \
    php-mysqli \
		mariadb-client \
    wget \
    php-phar \
    php84-iconv \
    tar

RUN mkdir -p /var/www/html && wget https://wordpress.org/latest.tar.gz \
    && tar -xzf latest.tar.gz -C /var/www/html --strip-components=1

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# RUN chown -R nginx: /var/www/html/
# ?

COPY ./tools/entrypoint.sh entrypoint.sh
# TODO: php version...
RUN sed -i "s/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/" /etc/php84/php-fpm.d/www.conf

EXPOSE 9000
CMD ["/bin/sh", "entrypoint.sh"]
