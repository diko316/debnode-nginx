From diko316/debnode

ENV NGINX_DAEMON=false

ADD ./tools $APP_TOOLS
COPY ./*.conf $PROJECT_ROOT/

RUN "$APP_TOOLS/installer/install.sh" \
        curl && \
    curl -sL http://nginx.org/keys/nginx_signing.key > /tmp/nginx_signing.key && \
    apt-key add /tmp/nginx_signing.key && \
    echo "deb http://nginx.org/packages/mainline/debian/ "$(lsb_release -cs)" nginx" >> /etc/apt/sources.list && \
    echo "deb-src http://nginx.org/packages/mainline/debian/ "$(lsb_release -cs)" nginx" >> /etc/apt/sources.list && \
    "$APP_TOOLS/installer/install.sh" \
	nginx \
	ca-certificates \
	nginx-module-xslt \
	nginx-module-geoip \
	nginx-module-image-filter \
	gettext-base && \
    "$APP_TOOLS/installer/uninstall.sh" \
        curl && \
    "$APP_TOOLS/installer/cleanup.sh"


CMD $APP_TOOLS/nginx/start.sh
