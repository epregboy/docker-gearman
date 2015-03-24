FROM ubuntu:trusty
MAINTAINER Aaron Mills <aaron.mills@returnpath.com>

ENV GEARMAN_VERSION 1.1.12

RUN apt-get update \
    && apt-get -y install wget vim gearman-tools libmysqld-dev mysql-client \
    libmemcached-dev build-essential libboost-all-dev gperf libevent-dev uuid-dev \
    && apt-get clean

RUN wget -P /tmp/ https://launchpad.net/gearmand/1.2/$GEARMAN_VERSION/+download/gearmand-$GEARMAN_VERSION.tar.gz

RUN cd /tmp && \
    tar xzf gearmand-$GEARMAN_VERSION.tar.gz && \
    cd gearmand-$GEARMAN_VERSION && \
    ./configure && \
    make && \
    make install

RUN mkdir -p /opt/gearman
WORKDIR /opt/gearman

COPY ./script /opt/gearman/script

EXPOSE 4730

CMD ["/opt/gearman/script/run.sh"]
