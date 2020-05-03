# Define the docker container to use
#

FROM ubuntu:rolling

# Define the user to use for the upcoming commands
# For gitpod.io there are two users in default
# gitpod and root
#

USER root

# Run commands to setup environment
#

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y wget curl git
RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Give back control to root
#

USER root
