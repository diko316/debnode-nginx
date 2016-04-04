#!/bin/sh

MAIN_CONF="${PROJECT_ROOT}/nginx.conf"
MAIN_CONF_FILE=/etc/nginx/nginx.conf

APP_CONF="${PROJECT_ROOT}/app.conf"
CONF_DIR=/etc/nginx/conf.d

service nginx stop &> /dev/null 2>/dev/null || true

if [ -f "${MAIN_CONF}" ]; then
    rm -Rf "${MAIN_CONF_FILE}"
    ln -s "${MAIN_CONF}" "${MAIN_CONF_FILE}"
    echo "* Using your custom nginx.conf file"
fi

if [ -f "${APP_CONF}" ]; then
    rm -Rf ${CONF_DIR}/*
    ln -s "${APP_CONF}" "${CONF_DIR}/default.conf"
    echo "* Using your custom app.conf file"
fi

echo "Starting nginx..."
if [ "${NGINX_DAEMON}" = "true" ]; then
    service nginx start || exit 1
else
    nginx -g 'daemon off;' || exit 1
fi

exit 0

