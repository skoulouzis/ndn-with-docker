FROM registry.lasseufpa.org/mrbs-nfd:c781794-1

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update &&\
    apt-get -y upgrade &&\
    BUILD_DEPS="\
        liblog4cxx10-dev \
        libprotobuf-dev \
        protobuf-compiler \
        libssl-dev \
        build-essential \
        git \
        pkg-config \
        libpcap-dev \
        ca-certificates \
        libboost-all-dev \
        libsqlite3-dev \
        libcrypto++-dev \
        " &&\
# Maybe also libprotobuf-lite9v5
    RUNTIME_DEPS=" \
        liblog4cxx10v5 \
        libprotobuf9v5 \
        libsqlite3-0 \
        netcat \
        netcat-openbsd \
    " &&\
    apt-get -y install --no-install-recommends \
        $BUILD_DEPS $RUNTIME_DEPS &&\
# NLSR
    git clone https://github.com/pedosb/NLSR &&\
    cd NLSR &&\
    git reset --hard 68c321652d19e541d8bcc95e1c448317f03fff3c &&\
    ./waf configure &&\
    ./waf &&\
    ./waf install &&\
    cd .. && rm -r NLSR &&\
    apt-get remove --purge -y $BUILD_DEPS &&\
    apt-get remove -y .*-dev &&\
    apt-get autoremove -y &&\
    rm -rf /var/lib/apt/lists /tmp/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
