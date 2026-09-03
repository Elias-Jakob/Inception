FROM alpine:3.23

RUN apk update && apk add php-fpm \
    php-mysql \
    wget \
    tar
    
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -vzf -x wordpress latest.tar.gz -C /var/www

# RUN chown -R nginx: /var/www/html/
# ?
