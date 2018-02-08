FROM nfd

ENV DEBIAN_FRONTEND=noninteractive

RUN git clone https://github.com/named-data/ChronoSync.git
WORKDIR ChronoSync
RUN ./waf configure --with-tests
RUN ./waf
RUN ./waf install
RUN ldconfig

RUN ./build/unit-tests
