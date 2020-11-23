#!/bin/bash
# Demyx
# https://demyx.sh
set -euo pipefail

# Support for old variables
[[ -n "${LOGROTATE_CONFIG:-}" ]] && DEMYX_CONFIG="$LOGROTATE_CONFIG"
[[ -n "${LOGROTATE_LOG:-}" ]] && DEMYX_LOG="$LOGROTATE_LOG"
[[ -n "${LOGROTATE_PATH:-}" ]] && DEMYX_PATH="$LOGROTATE_PATH"

# Set default path
if [[ -z "${DEMYX_PATH:-}" ]]; then
    DEMYX_PATH="$DEMYX_LOG"
    /bin/echo "Missing DEMYX_PATH environment variable, using default path: ${DEMYX_LOG}."
fi

# Generate config file
/bin/echo "${DEMYX_PATH}/*.log {
    weekly
    missingok
    copytruncate
    rotate 52
    notifempty
    sharedscripts
}
" > "$DEMYX_CONFIG"/logrotate.conf

# Execute sudo script
/usr/bin/sudo -E /usr/local/bin/demyx-logrotate
