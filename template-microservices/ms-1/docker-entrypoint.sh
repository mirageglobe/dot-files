#!/bin/bash

# ==> ref - https://success.docker.com/article/use-a-script-to-initialize-stateful-container-data

set -e

if [ "$1" = 'postgres' ]; then
    chown -R postgres "$PGDATA"

    if [ -z "$(ls -A "$PGDATA")" ]; then
        gosu postgres initdb
    fi

    exec gosu postgres "$@"
fi

exec "$@"


# ==> dockerfile for debian example to run the above as an external script

# FROM debian:stretch
# ...
# COPY docker-entrypoint.sh /usr/local/bin/
# RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat
# ENTRYPOINT ["docker-entrypoint.sh"]
# CMD ["postgres"]
