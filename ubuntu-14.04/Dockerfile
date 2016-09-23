FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install build-essential libsqlite3-dev libcrypto++-dev \
    libboost-all-dev libssl-dev
RUN apt-get -y install doxygen graphviz python-sphinx python-pip
RUN pip install sphinxcontrib-doxylink sphinxcontrib-googleanalytics
RUN apt-get -y install git
RUN apt-get -y install pkg-config libpcap-dev

RUN git clone -b ndn-cxx-0.4.1 --depth 1 https://github.com/cawka/ndn-cxx.git 
RUN cd ndn-cxx &&\
    ./waf configure &&\
    ./waf &&\
    ./waf install
RUN ldconfig

RUN git clone https://github.com/named-data/repo-ng.git
RUN cd repo-ng &&\
    git reset --hard 959c5b9740cec055def1347be8cb845eec1118af &&\
    ./waf configure &&\
    ./waf &&\
    ./waf install &&\
    mkdir -p /var/db/ndn-repo-ng &&\
    cp repo-ng.conf.sample /usr/local/etc/ndn/repo-ng.conf

RUN git clone -b NFD-0.4.1 --depth 1 --recursive https://github.com/named-data/NFD
RUN cd NFD &&\
    ./waf configure &&\
    ./waf &&\
    ./waf install &&\
    cp build/nfd.conf.sample /usr/local/etc/ndn/nfd.conf

RUN git clone --depth 1 https://github.com/pedosb/Consumer-Producer-API.git
RUN cd Consumer-Producer-API &&\
    git reset --hard cac3f14a82446aeb0f7591a00cf588eabc34ac13 &&\
    ./waf configure &&\
    ./waf &&\
    ./waf install
RUN ldconfig

RUN git clone https://github.com/named-data/ndn-tools
RUN cd ndn-tools &&\
    git reset --hard b5a5745c789cdc0ec9585115b831870b48f0feef &&\
    ./waf configure --disable-pib --disable-chunks &&\
    ./waf &&\
    ./waf install
