#!/bin/sh

DATA=/data

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

touch ${DATA}/.setup
