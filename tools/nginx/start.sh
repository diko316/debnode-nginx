#!/bin/sh

NXTOOLS_DIR=$(dirname $(readlink -m $0))

auto-sync

"${NXTOOLS_DIR}/run.sh"
