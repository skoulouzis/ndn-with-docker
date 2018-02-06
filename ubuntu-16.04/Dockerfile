FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install build-essential libsqlite3-dev libcrypto++-dev \
    libboost-all-dev libssl-dev

RUN apt-get -y install doxygen graphviz python-sphinx python-pip
RUN pip install --upgrade pip
RUN pip install sphinxcontrib-doxylink sphinxcontrib-googleanalytics websocket-client
RUN apt-get -y install git
RUN apt-get -y install pkg-config libpcap-dev software-properties-common

RUN add-apt-repository -y ppa:named-data/ppa
RUN apt-get -y update
RUN apt-get -y install ndn-cxx-dev ndn-cxx ndn-cxx-dbg ndn-autoconfig-client  ndnmap-data-collector ndns ndn-autoconfig-server ndn-dissect ndnpeek ndn-tlv-ping  ndn-dissect-wireshark ndn-pib ndn-tools ndndump ndnping ndn-traffic-generator 

RUN apt-get -y install nfd nfd-autoreg nfd-status-http-server nfdump-dbg nfdump-sflow nfd-all nfd-dbg nfdump nfdump-flow-tools  

                        
# RUN git clone https://github.com/named-data/ndn-cxx.git
# WORKDIR ndn-cxx
# RUN ./waf configure --enable-static
# RUN ./waf
# RUN ldconfig


# RUN git clone https://github.com/named-data/repo-ng.git
# WORKDIR repo-ng
# RUN ./waf configure
# RUN ./waf
# RUN ./waf install &&\
#     mkdir -p /var/db/ndn-repo-ng &&\
#     cp repo-ng.conf.sample /usr/local/etc/ndn/repo-ng.conf


RUN ndnsec-keygen /`whoami` | ndnsec-install-cert -
RUN mkdir -p /usr/local/etc/ndn/keys
RUN ndnsec-cert-dump -i /`whoami` > default.ndncert
RUN mv default.ndncert /usr/local/etc/ndn/keys/default.ndncert

RUN mkdir -p /usr/local/var/lib/ndn/nfd/.ndn
RUN ndnsec-keygen /localhost/daemons/nfd | ndnsec-install-cert -;
# 
RUN mkdir -p /usr/local/etc/ndn/certs || true;
RUN ndnsec-dump-certificate -i /localhost/daemons/nfd > /usr/local/etc/ndn/certs/localhost_daemons_nfd.ndncert

COPY nfd-start /usr/local/bin/
RUN cp /etc/ndn/client.conf.sample /root/.ndn/client.conf
RUN ls /root/.ndn/client.conf
# RUN chmod a+rwx /root/.ndn/client.conf
ENTRYPOINT /usr/local/bin/nfd-start -f
