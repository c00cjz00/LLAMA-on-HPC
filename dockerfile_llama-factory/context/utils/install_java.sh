#!/bin/bash

CONTEXT=/opt/docker/context

# install java
apt update && \
apt install -y openjdk-8-jdk && \
rm -rf /var/lib/apt/lists/*

# add env
echo -e "\n# java" >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
