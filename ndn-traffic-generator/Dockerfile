FROM nfd

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y install libpcap-dev

RUN git clone https://github.com/named-data/ndn-traffic-generator.git
WORKDIR ndn-traffic-generator
RUN ./waf configure
RUN ./waf
RUN ./waf install
RUN ldconfig


# CMD tail -f /dev/null

