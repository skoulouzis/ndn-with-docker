#!/bin/bash
# Wait for NFD

if [ ! "$1" ]
then
    echo Usage
    echo $0" <router_storage_dir>"
    exit 0
fi

export HOME=$1

nfd-start

while true;
do
    if nc -U /run/nfd.sock < /dev/null
    then
        break
    fi
    sleep 0.5
done

HOME=$1 nlsr -f $1/nlsr.conf
