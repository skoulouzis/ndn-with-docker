FROM ndn-cxx

ENV DEBIAN_FRONTEND=noninteractive

RUN git clone --recursive https://github.com/named-data/NFD
WORKDIR NFD
RUN ./waf configure
RUN ./waf
RUN ./waf install
RUN ldconfig

RUN cp /usr/local/etc/ndn/nfd.conf.sample /usr/local/etc/ndn/nfd.conf
RUN sed -ie "s/default_level .*/default_level DEBUG/" /usr/local/etc/ndn/nfd.conf
CMD nfd
# CMD tail -f /dev/null

