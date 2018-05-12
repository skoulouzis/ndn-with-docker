FROM alogo53/chronosync:0.6

ENV DEBIAN_FRONTEND=noninteractive

RUN git clone https://github.com/named-data/NLSR.git
WORKDIR NLSR
RUN ./waf configure
RUN ./waf
RUN ./waf install
RUN ldconfig

# RUN cp /usr/local/etc/ndn/nlsr.conf.sample /usr/local/etc/ndn/nlsr.conf
ADD nlsr.conf /usr/local/etc/ndn/nlsr.con
RUN mkdir /var/lib/nlsr

CMD screen -dm -L sh -c 'nfd' && sleep 2 && nlsr -f /usr/local/etc/ndn/nlsr.conf && tail -f screenlog.0