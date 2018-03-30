# FROM alogo53/ndn-cxx:0.6
FROM alogo53/nfd:0.6

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y install libpcap-dev

RUN git clone https://github.com/named-data/ndn-tools.git
WORKDIR ndn-tools
RUN ./waf configure --with-tests
RUN ./waf
RUN ./waf install
RUN ldconfig

CMD screen -dm -L sh -c 'nfd' && sleep 2 && tail -f screenlog.0
# CMD tail -f /dev/null

