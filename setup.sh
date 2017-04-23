#!/bin/sh

# install node.js and yarn
curl -sL https://deb.nodesource.com/setup_7.x | bash -

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# install php
apt-get update && apt-get upgrade -y
apt-get install -y git openssh-client zip curl libpng12-dev libgd-dev nodejs xvfb yarn netcat libnss3 libgconf-2-4
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install php extensions
docker-php-ext-install pdo_mysql gd zip
pecl install xdebug > /dev/null
docker-php-ext-enable xdebug
