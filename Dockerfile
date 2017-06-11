FROM ubuntu:16.04
MAINTAINER Tian XiaoJi <tianxiaoji@gmail.com>

#Install additional packages
RUN apt-get update
RUN apt-get --yes install sudo wget unzip vim inetutils-ping net-tools

#Install serf
RUN wget -q https://releases.hashicorp.com/serf/0.8.1/serf_0.8.1_linux_amd64.zip
RUN unzip serf_0.8.1_linux_amd64.zip
RUN sudo mv serf /usr/local/bin/
RUN rm serf_0.8.1_linux_amd64.zip
RUN sudo mkdir /serf
RUN sudo mkdir /serf/log

EXPOSE 7946 7373

CMD ["/bin/sh", "-c", "serf agent -iface=eth0 -rpc-addr=0.0.0.0:7373 > /serf/log/serf.log 2>&1"]