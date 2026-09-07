FROM alpine:3.23

RUN apk update && apk add php-fpm \
		php \
    php-mysqli \
    wget \
    tar

RUN mkdir -p /var/www/html && wget https://wordpress.org/latest.tar.gz \
    && tar -xzf latest.tar.gz -C /var/www/html --strip-components=1

# RUN chown -R nginx: /var/www/html/
# ?

COPY ./www.conf /etc/php84/php-fpm.d/www.conf
# COPY ./tools/startup.sh startup.sh

EXPOSE 9000
CMD ["/usr/sbin/php-fpm84", "-F"]
# CMD ["/bin/sh", "startup.sh"]
