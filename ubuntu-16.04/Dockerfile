FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:named-data/ppa
RUN apt-get update
# RUN apt-get install -y nfd


RUN apt-get install -y build-essential pkg-config libboost-all-dev libsqlite3-dev libssl-dev libpcap-dev git doxygen graphviz python-sphinx  python-pip
RUN pip install sphinxcontrib-doxylink sphinxcontrib-googleanalytics
RUN pip uninstall -y sphinxcontrib-doxylink
RUN git clone https://github.com/named-data/ndn-cxx
WORKDIR ndn-cxx
RUN ./waf configure --with-examples --debug --with-tests
RUN ./waf
RUN ./waf install
RUN ldconfig


RUN git clone --recursive https://github.com/named-data/NFD
WORKDIR NFD
RUN ./waf configure
RUN ./waf
RUN ./waf install

# RUN ndnsec-keygen /`whoami` | ndnsec-install-cert -
# RUN mkdir -p /usr/local/etc/ndn/keys
# RUN ndnsec-cert-dump -i /`whoami` > default.ndncert
# RUN mv default.ndncert /usr/local/etc/ndn/keys/default.ndncert
# RUN mkdir -p /usr/local/var/lib/ndn/nfd/.ndn
# RUN ndnsec-keygen /localhost/daemons/nfd | ndnsec-install-cert -;
# RUN mkdir -p /usr/local/etc/ndn/certs || true;
# RUN ndnsec-dump-certificate -i /localhost/daemons/nfd > /usr/local/etc/ndn/certs/localhost_daemons_nfd.ndncert

RUN cp /usr/local/etc/ndn/nfd.conf.sample /usr/local/etc/ndn/nfd.conf
CMD nfd
# CMD tail -f /dev/null

