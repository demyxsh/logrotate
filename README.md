# logrotate
[![Build Status](https://img.shields.io/travis/demyxco/logrotate?style=flat)](https://travis-ci.org/demyxco/logrotate)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/logrotate?style=flat&color=blue)](https://hub.docker.com/r/demyx/logrotate)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/logrotate)
[![Alpine](https://img.shields.io/badge/alpine-3.11.6-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/logrotate)
[![Logrotate](https://img.shields.io/badge/logrotate-3.15.1-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/logrotate)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)

Non-root Docker image running Alpine Linux and logrotate.

DEMYX | LOGROTATE
--- | ---
PORT | 3000
USER | demyx
WORKDIR | /demyx
CONFIG | /etc/demyx
ENTRYPOINT | ["dumb-init", "demyx"]
TIMEZONE | America/Los_Angeles

# Usage
```
logrotate:
    container_name: logrotate
    image: demyx/logrotate
    restart: unless-stopped
    environment:
      LOGROTATE_PATH: /var/log/demyx
      TZ: America/Los_Angeles
    volumes:
      - /logs:/var/log/demyx
```

## logrotate.conf
```
${LOGROTATE_PATH}/*.log {
  su root root
  weekly
  missingok
  copytruncate
  rotate 52
  notifempty
  sharedscripts
}
```

## Updates & Support
[![Code Size](https://img.shields.io/github/languages/code-size/demyxco/logrotate?style=flat&color=blue)](https://github.com/demyxco/logrotate)
[![Repository Size](https://img.shields.io/github/repo-size/demyxco/logrotate?style=flat&color=blue)](https://github.com/demyxco/logrotate)
[![Watches](https://img.shields.io/github/watchers/demyxco/logrotate?style=flat&color=blue)](https://github.com/demyxco/logrotate)
[![Stars](https://img.shields.io/github/stars/demyxco/logrotate?style=flat&color=blue)](https://github.com/demyxco/logrotate)
[![Forks](https://img.shields.io/github/forks/demyxco/logrotate?style=flat&color=blue)](https://github.com/demyxco/logrotate)

* Auto built weekly on Saturdays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://webchat.freenode.net/?channel=#demyx)
