FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
ARG RELESE_VERSION=0.5.1

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
        wget \
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
        libssl1.0.0 \
        libssl-dev \
    " &&\
    apt-get -y install --no-install-recommends \
        $BUILD_DEPS $RUNTIME_DEPS
# ndn-cxx
WORKDIR /root
# RUN git clone -b ndn-cxx-0.5.0 --depth 1 https://github.com/cawka/ndn-cxx.git
RUN wget https://github.com/named-data/ndn-cxx/archive/ndn-cxx-$RELESE_VERSION.tar.gz
RUN tar -xzvf ndn-cxx-$RELESE_VERSION.tar.gz
WORKDIR ndn-cxx-ndn-cxx-$RELESE_VERSION
RUN ./waf configure &&\
    ./waf &&\
    ./waf install &&\
    cd .. && rm -r ndn-cxx-ndn-cxx-$RELESE_VERSION && rm ndn-cxx-$RELESE_VERSION.tar.gz && ldconfig 
# NFD
WORKDIR /root
RUN  git clone -b NFD-$RELESE_VERSION --depth 1 --recursive https://github.com/named-data/NFD
WORKDIR NFD
RUN ./waf configure &&\
    ./waf &&\
    ./waf install &&\
    cp build/nfd.conf.sample /usr/local/etc/ndn/nfd.conf

# NDN tools
WORKDIR /root
RUN  git clone https://github.com/named-data/ndn-tools
WORKDIR ndn-tools
RUN  git reset --hard b5a5745c789cdc0ec9585115b831870b48f0feef &&\
    ./waf configure --disable-pib --disable-chunks &&\
    ./waf &&\
    ./waf install
#     cd .. && rm -r ndn-tools &&\
#     apt-get remove --purge -y $BUILD_DEPS && apt-get remove -y .*-dev && apt-get autoremove -y && rm -rf /var/lib/apt/lists /tmp/*
RUN apt-get remove -y .*-dev && apt-get autoremove -y && rm -rf /var/lib/apt/lists /tmp/*

COPY nfd-start /usr/local/bin/
ENTRYPOINT nfd-start -f
