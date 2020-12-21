#!/bin/bash
# Demyx
# https://demyx.sh
set -euo pipefail

# Support for old variables
[[ -n "${LOGROTATE_CONFIG:-}" ]] && DEMYX_CONFIG="$LOGROTATE_CONFIG"
[[ -n "${LOGROTATE_LOG:-}" ]] && DEMYX_LOG="$LOGROTATE_LOG"
[[ -n "${LOGROTATE_PATH:-}" ]] && DEMYX_PATH="$LOGROTATE_PATH"

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
