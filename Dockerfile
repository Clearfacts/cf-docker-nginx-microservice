FROM nginx:1.25-alpine as default

RUN apk add -U tzdata \
  && cp /usr/share/zoneinfo/Europe/Brussels /etc/localtime \
  && echo "Europe/Brussels" >  /etc/timezone \
  && apk del tzdata

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/upstream.conf /etc/nginx/conf.d/upstream.conf
COPY conf/php-fpm.conf /etc/nginx/conf.d/php-fpm.conf

# remove default config from base image
RUN rm /etc/nginx/conf.d/default.conf \
  # test nginx configuration
  && nginx -t

FROM default as long

RUN sed -i -E 's/(_timeout)(.*)(60)/\1\2300/' /etc/nginx/conf.d/php-fpm.conf && \
    cat /etc/nginx/conf.d/php-fpm.conf | grep timeout

# test nginx configuration
RUN nginx -t