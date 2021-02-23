FROM alpine

LABEL sh.demyx.image        demyx/logrotate
LABEL sh.demyx.maintainer   Demyx <info@demyx.sh>
LABEL sh.demyx.url          https://demyx.sh
LABEL sh.demyx.github       https://github.com/demyxco
LABEL sh.demyx.registry     https://hub.docker.com/u/demyx

# Set default variables
ENV DEMYX                   /demyx
ENV DEMYX_CONFIG            /etc/demyx
ENV DEMYX_INTERVAL          weekly
ENV DEMYX_LOG               /var/log/demyx
ENV DEMYX_PATH              "$DEMYX_LOG"
ENV TZ                      America/Los_Angeles
# Support for old variables
ENV LOGROTATE_ROOT          /demyx
ENV LOGROTATE_CONFIG        /etc/demyx
ENV LOGROTATE_LOG           /var/log/demyx

# Packages
RUN set -ex; \
    apk --update --no-cache add bash logrotate sudo tzdata

# Configure Demyx
RUN set -ex; \
    # Create demyx user
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx; \
    \
    # Create demyx directories
    install -d -m 0755 -o demyx -g demyx "$DEMYX"; \
    install -d -m 0755 -o demyx -g demyx "$DEMYX_CONFIG"; \
    install -d -m 0755 -o demyx -g demyx "$DEMYX_LOG"; \
    \
    # Update .bashrc
    echo 'PS1="$(whoami)@\h:\w \$ "' > /home/demyx/.bashrc; \
    echo 'PS1="$(whoami)@\h:\w \$ "' > /root/.bashrc

# Configure sudo
RUN set -ex; \
    echo "demyx ALL=(ALL) NOPASSWD:SETENV: /usr/local/bin/demyx-logrotate" > /etc/sudoers.d/demyx

# Imports
COPY --chown=root:root bin /usr/local/bin

# Finalize
RUN set -ex; \
    # Set ownership
    chown -R root:root /usr/local/bin

USER demyx

ENTRYPOINT ["demyx-entrypoint"]
