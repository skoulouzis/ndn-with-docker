FROM alogo53/ndn-cxx:0.6

ENV DEBIAN_FRONTEND=noninteractive

RUN git clone --recursive https://github.com/named-data/NFD
WORKDIR NFD
RUN ./waf configure
RUN ./waf
RUN ./waf install
RUN ldconfig

RUN cp /usr/local/etc/ndn/nfd.conf.sample /usr/local/etc/ndn/nfd.conf
RUN sed -ie "s/default_level .*/default_level ALL/" /usr/local/etc/ndn/nfd.conf
# 
# RUN ndnsec-keygen /`whoami` | ndnsec-install-cert -
# RUN mkdir -p /usr/local/etc/ndn/keys
# RUN ndnsec-cert-dump -i /`whoami` > default.ndncert
# RUN mv default.ndncert /usr/local/etc/ndn/keys/default.ndncert

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:named-data/ppa
RUN apt-get update

RUN apt-get -y install screen nfd

WORKDIR /root

CMD screen -dm -L sh -c 'nfd' && sleep 2 && tail -f screenlog.0
# CMD tail -f /dev/null

