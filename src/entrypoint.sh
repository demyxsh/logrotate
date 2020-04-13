#!/usr/bin/dumb-init /bin/bash
# Demyx
# https://demyx.sh
set -euo pipefail

# Set default path
if [[ -z "${LOGROTATE_PATH:-}" ]]; then
    LOGROTATE_PATH="$LOGROTATE_LOG"
    echo "Missing LOGROTATE_PATH environment variable, using default path: ${LOGROTATE_LOG}."
fi

# Generate config file
echo "${LOGROTATE_PATH}/*.log {
    weekly
    missingok
    copytruncate
    rotate 52
    notifempty
    sharedscripts
}
" > "$LOGROTATE_CONFIG"/logrotate.conf

# Execute sudo script
sudo demyx-logrotate
