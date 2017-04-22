#!/bin/sh

# install node.js
curl -sL https://deb.nodesource.com/setup_7.x | bash -

# install php
apt-get upgrade -y
apt-get install -y git openssh-client zip curl libpng12-dev libgd-dev nodejs xvfb
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install php extensions
docker-php-ext-install pdo_mysql gd zip
pecl install xdebug > /dev/null
docker-php-ext-enable xdebug
