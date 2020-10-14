# === usage
# docker build -t local-alpine .

# === info
# this is a base alpine image

FROM alpine:latest

# === defaults ===

ARG BUILD_DATE=0000-00-00
ARG VCS_REF=00000000

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/anon/changeme-project.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.name="mynewproject-alpine" \
      org.label-schema.description="image of changeme-project on alpine" \
      org.label-schema.url="https://github.com/anon/changeme-project"

# define dependencies

ENV TERM xterm
ENV BUILD_DEPS tini \
      curl \
      make
      # build-base \
      # git
ENV RUNTIME_DEPS bash \
      wget \
      tree \
      python3 \
      the_silver_searcher \
      vim

# === setup environment ===

# ==> add init helper scripts
# note - with +X recursive permissions
#
COPY ./docker-helper-scripts /opt/docker-helper-scripts
RUN chmod -R +x /opt/docker-helper-scripts
# RUN chmod +x /opt/docker-helper-scripts/docker-entrypoint.sh
#
# alternatively copy the script needed directly into bin
# COPY ./docker-entrypoint-keepalive.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint-keepalive.sh

# ==> adding using tini process manager
# note - https://github.com/krallin/tini 
# note - this is default in docker but not yet in docker(mac)

# ==> apply dependencies
RUN apk add --no-cache $BUILD_DEPS
RUN apk add $RUNTIME_DEPS

# ==> set working directory
WORKDIR /app

# ==> copy project to container
COPY ./src /app

# ==> build project if required
RUN echo "==> init project"

# custom permissions for project files - recursive change with +X
RUN chmod +x /app/test.py

# expose app/container instance ports
# EXPOSE 8080

# === core runner ===

# -- tini
# adding using tini process manager - https://github.com/krallin/tini
# notes : this is default in docker but not yet in docker(mac)
# 
# ENV TINI_VERSION v0.18.0
# ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
# 
# RUN chmod +x /tini
# 
# default entry prepend - 
# ENTRYPOINT ["/bin/sh", "-c"]
ENTRYPOINT ["/sbin/tini", "-s", "--"]
# ENTRYPOINT ["/tini", "--", "docker-entrypoint-keepalive.sh"]
# ENTRYPOINT ["/", "--", "docker-entrypoint-keepalive.sh"]
# 
# default command
# CMD ["echo", "test"]
CMD ["env"]
# CMD ["/usr/bin/wc", "--help"]
# CMD ["/opt/docker-helper-scripts/docker-entrypoint-keepalive.sh"]
# 
# -- tini end

