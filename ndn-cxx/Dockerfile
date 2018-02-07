FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:named-data/ppa
RUN apt-get update

RUN apt-get install -y build-essential pkg-config libboost-all-dev libsqlite3-dev libssl-dev libpcap-dev git doxygen graphviz python-sphinx  python-pip
RUN pip install sphinxcontrib-doxylink sphinxcontrib-googleanalytics
RUN pip uninstall -y sphinxcontrib-doxylink
RUN git clone https://github.com/named-data/ndn-cxx
WORKDIR ndn-cxx
RUN ./waf configure --with-examples --debug --with-tests
RUN ./waf
RUN ./waf install
RUN ldconfig


