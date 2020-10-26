FROM debian

MAINTAINER Matthias Munz <matthias.munz@gmx.de>

RUN apt-get update && apt-get -y --no-install-recommends install ruby ruby-dev bundler build-essential libcurl4-openssl-dev gnupg wget && apt-get clean
RUN /usr/bin/apt-key adv --keyserver pool.sks-keyservers.net --recv 1078ECD7
RUN echo "deb http://apt.arvados.org/ bionic main" | tee /etc/apt/sources.list.d/arvados.list
RUN apt-get update && apt-get -y --no-install-recommends install python-arvados-python-client python-arvados-fuse && apt-get clean
RUN gem install arvados-cli

