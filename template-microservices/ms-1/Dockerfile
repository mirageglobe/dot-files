FROM alpine:latest

ARG BUILD_DATE=0000-00-00
ARG VCS_REF=00000000

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/mirageglobe/changeme-project.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.name="mynewproject-alpine" \
      org.label-schema.description="Docker image of changeme-project on alpine" \
      org.label-schema.url="https://github.com/mirageglobe/changeme-project"

# define dependancies
ENV TERM=xterm \
    DEPS=vim

# apply dependancies
RUN apk add $DEPS

# set working directory
WORKDIR /opt

# expose app/container instance ports
EXPOSE 8080

# set default init script
COPY ./docker-entrypoint.sh /usr/local/bin/

# adding using tini process manager - https://github.com/krallin/tini 
# notes : this is default in docker but not yet in docker(mac)
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--", "docker-entrypoint.sh"]

