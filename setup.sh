#!/bin/sh

# install node.js and yarn
curl -sL https://deb.nodesource.com/setup_7.x | bash -

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# install php
apt-get update && apt-get upgrade -y
apt-get install -y git openssh-client zip curl libpng12-dev libgd-dev nodejs xvfb yarn netcat libnss3 libgconf-2-4 wget zlib1g-dev libicu-dev g++ libpq-dev
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# chrome dev
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
apt-get update && apt-get install -y google-chrome-unstable

# set memory limit
echo "memory_limit=1024M" > /usr/local/etc/php/conf.d/memory-limit.ini

# install php extensions
RUN docker-php-ext-configure intl
docker-php-ext-install pdo_mysql gd zip bcmath intl pdo_pgsql
pecl install xdebug > /dev/null
docker-php-ext-enable xdebug bcmath
