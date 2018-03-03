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

RUN ndnsec-keygen /`whoami` | ndnsec-install-cert -
RUN mkdir -p /usr/local/etc/ndn/keys
RUN ndnsec-cert-dump -i /`whoami` > default.ndncert
RUN mv default.ndncert /usr/local/etc/ndn/keys/default.ndncert

RUN apt-get -y install screen 

WORKDIR /root
COPY script.sh .
RUN chmod +x script.sh 

CMD screen -dm -L sh -c 'nfd'
# CMD tail -f /dev/null

