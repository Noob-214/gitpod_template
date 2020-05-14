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
RUN apt-get install -y apt-utils \
python3 \
python3-pip \
build-essential \
wget \
curl \
zip \
fonts-liberation \
libappindicator3-1 \
libatk-bridge2.0-0 \
libatk1.0-0 \
libatspi2.0-0 \
libcups2 \
libdrm2 \
libgbm1 \
libgtk-3-0 \
libnspr4 \
libnss3 \
libx11-xcb1 \
libxcomposite1 \
libxcursor1 \
libxcb-dri3-0 \
libxdamage1 \
libxfixes3 \
libxi6 \
libxrandr2 \
libxss1 \
libxtst6 \
xdg-utils \
libu2f-udev \
libvulkan1 

RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Install Google Chrome
#

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -f -y ./google-chrome-stable_current_amd64.deb
RUN rm -fr google-chrome-stable_current_amd64.deb

# Install Google Chrome Webdriver
#

RUN wget https://chromedriver.storage.googleapis.com/81.0.4044.138/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/bin
RUN rm -fr chromedriver_linux64.zip

# Define environment variables
#

#ENV ARCH=arm64
#ENV SUBARCH=arm64


# Give back control to root
#

USER root
