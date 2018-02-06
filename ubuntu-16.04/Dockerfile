FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install build-essential libsqlite3-dev libcrypto++-dev \
    libboost-all-dev libssl-dev

RUN apt-get -y install doxygen graphviz python-sphinx python-pip
RUN pip install --upgrade pip
RUN pip install sphinxcontrib-doxylink sphinxcontrib-googleanalytics
RUN apt-get -y install git
RUN apt-get -y install pkg-config libpcap-dev software-properties-common

# RUN add-apt-repository -y ppa:named-data/ppa
# RUN apt-get -y update
# RUN apt-get -y install ndn-cxx-dev ndn-cxx


RUN git clone https://github.com/named-data/ndn-cxx.git
WORKDIR ndn-cxx 
RUN ./waf configure 
RUN ./waf 
RUN ./waf install
RUN ldconfig


RUN git clone https://github.com/named-data/repo-ng.git
RUN cd repo-ng &&\
    ./waf configure &&\
    ./waf &&\
    ./waf install &&\
    mkdir -p /var/db/ndn-repo-ng &&\
    cp repo-ng.conf.sample /usr/local/etc/ndn/repo-ng.conf
    
    

RUN add-apt-repository -y ppa:named-data/ppa
RUN apt-get -y update
RUN apt-get -y install nfd    

# RUN git clone --depth 1 --recursive https://github.com/named-data/NFD
# RUN cd NFD &&\
#     ./waf configure &&\
#     ./waf &&\
#     ./waf install &&\
#     cp build/nfd.conf.sample /usr/local/etc/ndn/nfd.conf

RUN git clone https://github.com/named-data/Consumer-Producer-API.git
WORKDIR Consumer-Producer-API
RUN ./waf configure
RUN ./waf &&\
    ./waf install
RUN ldconfig

RUN git clone https://github.com/named-data/ndn-tools
WORKDIR ndn-tools
#     git reset --hard b5a5745c789cdc0ec9585115b831870b48f0feef &&
RUN    ./waf configure --disable-pib --disable-chunks &&\
    ./waf &&\
    ./waf install

    
RUN mkdir -p /usr/local/var/lib/ndn/nfd/.ndn
RUN ndnsec-keygen /localhost/daemons/nfd | ndnsec-install-cert -;

RUN mkdir -p /usr/local/etc/ndn/certs || true;
RUN ndnsec-dump-certificate -i /localhost/daemons/nfd > /usr/local/etc/ndn/certs/localhost_daemons_nfd.ndncert

COPY nfd-start /usr/local/bin/
ENTRYPOINT nfd-start -f
