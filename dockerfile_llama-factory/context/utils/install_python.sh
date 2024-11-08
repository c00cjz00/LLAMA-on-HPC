#!/bin/bash

# install python3.8, 3.9, 3.10
add-apt-repository -y ppa:deadsnakes/ppa
apt update && \
apt install -y python3.8  python3.8-distutils  python3.8-venv && \
apt install -y python3.9  python3.9-distutils  python3.9-venv && \
apt install -y python3.10 python3.10-distutils python3.10-venv && \
rm -rf /var/lib/apt/lists/*

# install pip3.8, pip3.9, pip3.10
curl -O https://bootstrap.pypa.io/get-pip.py
python3.8  get-pip.py
python3.9  get-pip.py
python3.10 get-pip.py
rm get-pip.py

# set python3.10 to default
#update-alternatives --install /usr/bin/python python /usr/bin/python3.8  3
#update-alternatives --install /usr/bin/python python /usr/bin/python3.9  2
#update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1
cp /usr/bin/python3.10 /usr/bin/python && cp /usr/bin/python3.10 /usr/bin/python3

# set pip3.10 to default
#update-alternatives --install /usr/local/bin/pip pip /usr/local/bin/pip3.8  3
#update-alternatives --install /usr/local/bin/pip pip /usr/local/bin/pip3.9  2
#update-alternatives --install /usr/local/bin/pip pip /usr/local/bin/pip3.10 1
cp /usr/local/bin/pip3.10 /usr/local/bin/pip  && cp /usr/local/bin/pip3.10 /usr/local/bin/pip3
