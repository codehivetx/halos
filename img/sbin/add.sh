#!/bin/sh
if [ $# -lt 2 ];
then
    echo >&2 'ERR: usage: $0 id "name"'
    exit 1
fi

exec adduser -h /data/u/"${1}" -g "${2}" "${1}"


