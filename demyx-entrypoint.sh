#!/bin/sh
# Demyx
# https://demyx.sh

[[ -z "$DEMYX_LOG" ]] && echo "Missing DEMYX_LOG environment variable, exiting." && exit 1

echo "
${DEMYX_LOG}/*.log {
	su root root
	weekly
	missingok
	copytruncate
	rotate 52
	notifempty
	sharedscripts
}
" > /demyx.conf

logrotate --force /demyx.conf
