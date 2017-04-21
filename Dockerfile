FROM php:7.1-cli
RUN echo "short_open_tag=0" > /usr/local/etc/php/conf.d/disable_short_open_tag.ini

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y --force-yes unzip curl git
RUN curl -Ss https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

RUN apt-get clean

RUN mkdir /php-monolog-json-formatter

COPY composer.json /php-monolog-json-formatter
RUN cd /php-monolog-json-formatter && composer install

CMD ["tail", "-f", "/etc/debian_version"]
