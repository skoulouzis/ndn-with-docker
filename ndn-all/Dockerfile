FROM nslr

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y install libpcap-dev sqlite3 libsqlite3-dev

RUN git clone https://github.com/named-data/ndn-tools.git
WORKDIR ndn-tools
RUN ./waf configure --with-tests
RUN ./waf
RUN ./waf install
RUN ldconfig

RUN git clone https://github.com/named-data/ndn-traffic-generator.git
WORKDIR ndn-traffic-generator
RUN ./waf configure
RUN ./waf
RUN ./waf install
RUN ldconfig

RUN git clone https://github.com/named-data/repo-ng.git
WORKDIR repo-ng
RUN ./waf configure --with-tests
RUN ./waf
RUN ./waf install
RUN ldconfig

RUN cp /usr/local/etc/ndn/repo-ng.conf.sample /usr/local/etc/ndn/repo-ng.conf
RUN mkdir -p /var/db/ndn-repo-ng


# CMD tail -f /dev/null

