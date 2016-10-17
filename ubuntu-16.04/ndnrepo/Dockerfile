FROM registry.lasseufpa.org/nlsr-16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update &&\
    apt-get -y upgrade &&\
    BUILD_DEPS="\
        git \
        python-pip \
        python-setuptools \
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
    RUNTIME_DEPS="\
        python \
        netcat-openbsd \
        python-pkg-resources \
    " &&\
    apt-get -y install --no-install-recommends \
        $BUILD_DEPS $RUNTIME_DEPS &&\
    pip install j2cli &&\
# repo-ng
    git clone https://github.com/named-data/repo-ng &&\
    cd repo-ng &&\
    git reset --hard 959c5b9740cec055def1347be8cb845eec1118af &&\
    ./waf configure &&\
    ./waf &&\
    ./waf install &&\
    cd .. && rm -r repo-ng &&\
    apt-get remove --purge -y $BUILD_DEPS &&\
    apt-get remove -y .*-dev &&\
    apt-get autoremove -y &&\
    rm -rf /var/lib/apt/lists /tmp/*

RUN \
    mkdir -p /var/db/ndn-repo-ng

COPY \
    repo-ng.conf.sample \
    entrypoint.sh \
    /entrypoint/

ENTRYPOINT ["/entrypoint/entrypoint.sh"]
CMD [""]
