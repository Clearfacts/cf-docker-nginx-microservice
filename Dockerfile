FROM nginx:1.11-alpine

RUN cp /usr/share/zoneinfo/Europe/Brussels /etc/localtime

COPY conf/upstream.conf /etc/nginx/conf.d/upstream.conf
COPY conf/php-fpm.conf /etc/nginx/conf.d/php-fpm.conf

