# Define the docker container to use
#

#FROM ubuntu:rolling
FROM gitpod/workspace-full:latest

# Define the user to use for the upcoming commands
# For gitpod.io there are two users in default
# gitpod and root
#

USER root

# Run commands to setup environment
#

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y python3 python3-pip build-essential wget curl zip 
RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Install Google Chrome
#

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install -f -y ./google-chrome-stable_current_amd64.deb
rm -fr google-chrome-stable_current_amd64.deb

# Install Google Chrome Webdriver
#

wget https://chromedriver.storage.googleapis.com/81.0.4044.138/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
mv chromedriver /usr/bin
rm -fr chromedriver_linux64.zip

# Define environment variables
#

#ENV ARCH=arm64
#ENV SUBARCH=arm64


# Give back control to root
#

USER root
