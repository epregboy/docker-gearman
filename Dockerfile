FROM ubuntu:trusty
MAINTAINER Aaron Mills <aaron.mills@returnpath.com>

RUN apt-get update \
    && apt-get -y install gearman-tools gearman-job-server mysql-client \
    && apt-get clean

RUN mkdir -p /opt/gearman && chown gearman /opt/gearman

WORKDIR /opt/gearman
USER gearman

COPY ./script /opt/gearman/script

CMD ["/opt/gearman/script/run.sh"]

