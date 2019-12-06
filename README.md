# logrotate
[![Build Status](https://img.shields.io/travis/demyxco/logrotate?style=flat)](https://travis-ci.org/demyxco/logrotate)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/logrotate?style=flat&color=blue)](https://hub.docker.com/r/demyx/logrotate)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/logrotate)
[![Alpine](https://img.shields.io/badge/alpine-3.10.3-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/logrotate)
[![Logrotate](https://img.shields.io/badge/logrotate-3.15.0-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/logrotate)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)

logrotate is designed to ease administration of systems that generate large numbers of log files. It allows automatic rotation, compression, removal, and mailing of log files. Each log file may be handled daily, weekly, monthly, or when it grows too large.

TITLE | DESCRIPTION
--- | ---
ENTRYPOINT | dumb-init demyx-entrypoint
TIMEZONE | America/Los_Angeles

## Updates & Support
[![Code Size](https://img.shields.io/github/languages/code-size/demyxco/logrotate?style=flat&color=blue)](https://github.com/demyxco/logrotate)
[![Repository Size](https://img.shields.io/github/repo-size/demyxco/logrotate?style=flat&color=blue)](https://github.com/demyxco/logrotate)
[![Watches](https://img.shields.io/github/watchers/demyxco/logrotate?style=flat&color=blue)](https://github.com/demyxco/logrotate)
[![Stars](https://img.shields.io/github/stars/demyxco/logrotate?style=flat&color=blue)](https://github.com/demyxco/logrotate)
[![Forks](https://img.shields.io/github/forks/demyxco/logrotate?style=flat&color=blue)](https://github.com/demyxco/logrotate)

* Auto built weekly on Sundays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://webchat.freenode.net/?channel=#demyx)

# Usage
```
logrotate:
    container_name: logrotate
    image: demyx/logrotate
    restart: unless-stopped
    environment:
      DEMYX_LOG: /var/log/demyx
      TZ: America/Los_Angeles
    volumes:
      - ./logs:/var/log/demyx
```

## demyx.conf
```
${DEMYX_LOG}/*.log {
  su root root
  weekly
  missingok
  copytruncate
  rotate 52
  notifempty
  sharedscripts
}
```
