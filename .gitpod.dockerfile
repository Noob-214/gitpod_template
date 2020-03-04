FROM gitpod/workspace-full:latest
USER root
RUN apt-get update
RUN apt-get install -y wget curl git sudo
RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
RUN chmod a+x setup.sh
RUN ./setup.sh
USER root
