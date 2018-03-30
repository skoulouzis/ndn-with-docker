FROM alogo53/chronosync:0.6

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install protobuf-c-compiler protobuf-compiler libprotobuf* python-protobuf qt5-qmake qtchooser qt5-default libtinyxml-dev wget

WORKDIR /root
# RUN git clone https://github.com/named-data/ChronoShare.git
RUN wget https://github.com/named-data/ChronoShare/archive/0.1.0.tar.gz
RUN tar -xzvf 0.1.0.tar.gz
RUN mv ChronoShare-0.1.0 ChronoShare
WORKDIR ChronoShare
RUN ./waf configure
RUN ./waf
RUN ./waf install
RUN ldconfig

CMD screen -dm -L sh -c 'nfd' && sleep 2 && tail -f  screenlog.0