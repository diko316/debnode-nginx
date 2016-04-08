#!/bin/sh

RELEASE=$(lsb_release -cs)


curl -sL http://nginx.org/keys/nginx_signing.key > /tmp/nginx_signing.key || exit 1
apt-key add /tmp/nginx_signing.key || exit 2
echo "deb http://nginx.org/packages/mainline/debian/ ${RELEASE} nginx" >> /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/mainline/debian/ ${RELEASE} nginx" >> /etc/apt/sources.list

${APP_TOOLS}/installer/install.sh nginx || exit 3

### create start nginx shortcut
ln -s ${APP_TOOLS}/nginx/start.sh /usr/local/bin/start-nginx
