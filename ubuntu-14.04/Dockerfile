FROM lasseubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install build-essential libsqlite3-dev libcrypto++-dev libboost-all-dev
RUN apt-get -y install doxygen graphviz python-sphinx python-pip
RUN pip install sphinxcontrib-doxylink sphinxcontrib-googleanalytics
RUN apt-get -y install git
RUN apt-get -y install pkg-config libpcap-dev

RUN git clone --depth 1 https://github.com/cawka/ndn-cxx.git
RUN git clone --depth 1 --recursive https://github.com/named-data/NFD
RUN git clone --depth 1 https://github.com/named-data/repo-ng.git

RUN cd ndn-cxx &&\
    ./waf configure &&\
    ./waf -j 8 &&\
    ./waf install
RUN ldconfig

RUN cd repo-ng &&\
    ./waf configure &&\
    ./waf &&\
    ./waf install &&\
    mkdir -p /var/db/ndn-repo-ng &&\
    cp repo-ng.conf.sample /usr/local/etc/ndn/repo-ng.conf

RUN cd NFD &&\
    ./waf configure &&\
    ./waf &&\
    ./waf install &&\
    cp build/nfd.conf.sample /usr/local/etc/ndn/nfd.conf

RUN git clone --depth 1 https://github.com/pedosb/Consumer-Producer-API.git
RUN cd Consumer-Producer-API &&\
    ./waf configure &&\
    ./waf &&\
    ./waf install
RUN ldconfig
