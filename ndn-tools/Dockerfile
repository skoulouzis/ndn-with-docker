FROM nfd

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y install libpcap-dev

RUN git clone https://github.com/named-data/ndn-tools.git
WORKDIR ndn-tools
RUN ./waf configure --with-tests
RUN ./waf
RUN ./waf install
RUN ldconfig


# CMD tail -f /dev/null

