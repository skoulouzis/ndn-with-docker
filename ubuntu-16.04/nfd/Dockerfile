FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update &&\
    apt-get -y upgrade &&\
    BUILD_DEPS="\
        build-essential \
        libsqlite3-dev \
        libcrypto++-dev \
        libssl-dev \
        git \
        pkg-config \
        libpcap-dev \
        ca-certificates \
        libboost-all-dev \
        " &&\
    RUNTIME_DEPS=" \
        libboost-system1.58.0 \
        libboost-filesystem1.58.0 \
        libboost-date-time1.58.0 \
        libboost-iostreams1.58.0 \
        libboost-regex1.58.0 \
        libboost-program-options1.58.0 \
        libboost-chrono1.58.0 \
        libboost-random1.58.0 \
        libboost-thread1.58.0 \
        libboost-log1.58.0 \
        libcrypto++9v5 \
        libpcap0.8 \
    " &&\
    apt-get -y install --no-install-recommends \
        $BUILD_DEPS $RUNTIME_DEPS &&\
# ndn-cxx
    git clone -b ndn-cxx-0.5.0 \
        --depth 1 https://github.com/cawka/ndn-cxx.git &&\
    cd ndn-cxx &&\
    ./waf configure &&\
    ./waf &&\
    ./waf install &&\
    cd .. && rm -r ndn-cxx &&\
    ldconfig &&\
# NFD
    git clone -b NFD-0.5.0 \
    --depth 1 --recursive https://github.com/named-data/NFD &&\
    cd NFD &&\
    ./waf configure &&\
    ./waf &&\
    ./waf install &&\
    cp build/nfd.conf.sample /usr/local/etc/ndn/nfd.conf &&\
    cd .. && rm -r NFD &&\
# NDN tools
    git clone https://github.com/named-data/ndn-tools &&\
    cd ndn-tools &&\
    git reset --hard b5a5745c789cdc0ec9585115b831870b48f0feef &&\
    ./waf configure --disable-pib --disable-chunks &&\
    ./waf &&\
    ./waf install &&\
    cd .. && rm -r ndn-tools &&\
    apt-get remove --purge -y $BUILD_DEPS &&\
    apt-get remove -y .*-dev &&\
    apt-get autoremove -y &&\
    rm -rf /var/lib/apt/lists /tmp/*

COPY nfd-start /usr/local/bin/
ENTRYPOINT nfd-start -f
