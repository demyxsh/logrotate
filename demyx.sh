#!/bin/sh
# Demyx
# https://demyx.sh
set -euo pipefail

if [[ -z "${LOGROTATE_PATH:-}" ]]; then
    LOGROTATE_PATH="$LOGROTATE_LOG"
    echo "Missing LOGROTATE_PATH environment variable, using default path: ${LOGROTATE_LOG}."
fi

echo "${LOGROTATE_PATH}/*.log {
    su root root
    weekly
    missingok
    copytruncate
    rotate 52
    notifempty
    sharedscripts
}
" > "$LOGROTATE_CONFIG"/logrotate.conf

logrotate --force "$LOGROTATE_CONFIG"/logrotate.conf
