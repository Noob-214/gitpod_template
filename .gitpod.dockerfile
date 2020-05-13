# Define the docker container to use
#

FROM ubuntu:rolling
#FROM gitpod/workspace-full:latest

# Define the user to use for the upcoming commands
# For gitpod.io there are two users in default
# gitpod and root
#

USER root

# Run commands to setup environment
#

RUN apt update
RUN apt dist-upgrade -y
RUN apt install -y python3 python3-pip build-essential libncurses5-dev libncursesw5-dev wget curl git zip 
RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Download and install Google Chrome
#

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install ./google-chrome-stable_current_amd64.deb -y
RUN rm google-chrome-stable_current_amd64.deb -fr

# Download Chrome Webdriver
#

RUN wget https://chromedriver.storage.googleapis.com/81.0.4044.138/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN rm chromedriver_linux64.zip -fr

# Define environment variables
#

#ENV ARCH=arm64
#ENV SUBARCH=arm64

# Give back control to root
#

USER root
