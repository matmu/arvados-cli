FROM debian:buster

MAINTAINER Matthias Munz <matthias.munz@gmx.de>

RUN apt-get update && apt-get -y --no-install-recommends install ruby-full bundler build-essential libcurl4-openssl-dev apt-utils gnupg wget dirmngr curl bzip2 git libtbb2 && apt-get clean && ruby --version
#RUN /usr/bin/apt-key adv --keyserver pgp.mit.edu --recv 1078ECD7
RUN /usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv 1078ECD7
RUN echo "deb http://apt.arvados.org/buster buster main" | tee /etc/apt/sources.list.d/arvados.list
RUN apt-get update && apt-get -y --no-install-recommends install python-arvados-python-client python-arvados-fuse && apt-get clean
RUN gem install arvados-cli
