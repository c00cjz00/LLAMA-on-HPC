#!/bin/bash

CONTEXT=/opt/docker/context

# apt package
apt update && \
xargs apt install -y < $CONTEXT/extension/requirements.apt && \
rm -rf /var/lib/apt/lists/*
