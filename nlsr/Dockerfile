FROM chrono_sync

ENV DEBIAN_FRONTEND=noninteractive

RUN git clone https://github.com/named-data/NLSR.git
WORKDIR NLSR
RUN ./waf configure
RUN ./waf
RUN ./waf install
RUN ldconfig

RUN cp /usr/local/etc/ndn/nlsr.conf.sample /usr/local/etc/ndn/nlsr.conf

CMD nlsr -f /usr/local/etc/ndn/nlsr.conf