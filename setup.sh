#!/bin/sh
apt-get update && apt-get upgrade -y
apt-get install -y git openssh-client zip curl libpng12-dev libgd-dev
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

docker-php-ext-install pdo_mysql gd
pecl install xdebug > /dev/null
docker-php-ext-enable xdebug
