#!/bin/bash
set -e

if [ ! "$1" ]
then
    echo Usage
    echo $0" [<nlsr-home>] <repo-prefix>"
    exit 0
fi

if [ "$2" ]
then
    NLSR_HOME=$1
    REPO_PREFIX=$2
else
    REPO_PREFIX=$1
fi

PREFIX=$REPO_PREFIX j2 $(dirname $0)/repo-ng.conf.sample \
    > /usr/local/etc/ndn/repo-ng.conf

nfd-start

while true;
do
    if nc -U /run/nfd.sock < /dev/null
    then
        break
    fi
    sleep 0.5
done

if [ "$NLSR_HOME" ]
then
    HOME=$NLSR_HOME nlsr -d -f $1/nlsr.conf
fi
ndn-repo-ng
