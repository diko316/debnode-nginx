From diko316/debnode

ENV NGINX_DAEMON=false

COPY ./tools $APP_TOOLS
COPY ./conf/* $PROJECT_ROOT/

RUN auto-build \
        --apt curl \
        --builder $APP_TOOLS/nginx/setup.sh

CMD $APP_TOOLS/nginx/start.sh
