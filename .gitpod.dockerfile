FROM ubuntu:rolling
USER root
RUN apt-get update
RUN apt-get install -y wget curl git sudo rclone
RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
USER root
