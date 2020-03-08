FROM ubuntu:rolling
USER root
RUN apt-get update
RUN apt-get install -y wget curl git sudo
RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
RUN add-apt-repository ppa:alessandro-strada/ppa
RUN apt-get update
RUN apt-get install google-drive-ocamlfuse
USER root
