FROM alpine:3.18.3
LABEL maintainer="Steven R. Loomis <srl295@gmail.com>" org.opencontainers.image.source="https://github.com/codehivetx/halos"
VOLUME /data
# EXTRA: for admin
RUN apk add --no-cache emacs-nox
# set TZ
RUN apk add --no-cache tzdata
ENV TZ=America/Chicago
RUN cp /usr/share/zoneinfo/America/Chicago /etc/localtime
# install base stuff
RUN apk add --no-cache alpine exim exim-utils openrc patch nodejs inetutils-telnet
# will initialize stuff, but we can ignore it
# keep all data here
ADD /sbin/ /usr/local/sbin/
ADD /patch/ /usr/local/share/patch/
ADD /alpine.d/ /etc/alpine.d/
# TODO: use a proper release
RUN wget -O /usr/local/sbin/server.js https://raw.githubusercontent.com/srl295/node-chat/feat/server.js
ADD /bin/ /usr/local/bin/
ADD /LICENSE /
CMD sleep infinity
