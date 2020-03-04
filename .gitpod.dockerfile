FROM ubuntu:rolling
USER root
RUN apt-get update
RUN apt-get install -y wget curl git sudo neofetch
RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
RUN git clone https://github.com/x0rzavi/gitpod_template --depth=1
RUN chmod a+x gitpod_template/setup.sh
RUN ./gitpod_template/setup.sh
RUN rm -rf gitpod_template
USER root
