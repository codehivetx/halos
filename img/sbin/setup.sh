#!/bin/sh

DATA=/data

echo "starting chat server"
node /usr/local/sbin/server.js >> /data/server.log >&1 &


if [ -f ${DATA}/.setup ];
then
    echo >&2 "ERR already setup - delete ${DATA}/.setup if wrong!"
    exit 1
fi

if [ $# -lt 1 ];
then
    echo >&2 "ERR usage: $0 full.host.name"
    exit 1
fi

OLDHOST=$(hostname)
OLDIP=$(grep ${OLDHOST} /etc/hosts | cut -f1)
HST=$1

echo "HOST: $1"
echo "OLDHOST: ${OLDHOST} ${OLDIP}"

# TODO: can't change hostname on alpine?
#hostname ${HST}

# TODO: will need to be 127.0.0.1?
echo "${OLDIP}  ${HST}" >> /etc/hosts

## SETUP
# TODO: fix mail
mv /etc/exim ${DATA}/exim
ln -s ${DATA}/exim /etc/exim
( cd /etc/exim && patch < /usr/local/share/patch/exim.conf.patch )

mkdir -p ${DATA}/mail ${DATA}/u
rmdir /var/mail
ln -s ${DATA}/mail /var/mail
chgrp mail ${DATA}/mail
chmod 2775 /var/mail

touch ${DATA}/.setup

service exim start
rc-update add exim

echo "Now add users with add.sh"

