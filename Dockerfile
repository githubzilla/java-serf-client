FROM ubuntu:16.04
MAINTAINER Tian XiaoJi <tianxiaoji@gmail.com>

ADD ./serf-agent.conf ./
ADD ./provision-in-docker.sh ./provision.sh

RUN apt-get update
RUN apt-get --yes install sudo wget unzip

RUN chmod +x ./provision.sh
RUN ./provision.sh

EXPOSE 5000 7373

CMD ["sudo", "start", "serf-agent"]