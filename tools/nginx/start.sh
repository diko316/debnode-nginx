#!/bin/sh

NXTOOLS_DIR=$(dirname $(readlink -m $0))

"${APP_TOOLS}/watcher/watch-source.sh"

"${NXTOOLS_DIR}/run.sh"
