#!/bin/bash

CONTEXT=/opt/docker/context

# jupyter configuration
jupyter notebook --generate-config
cat $CONTEXT/utils/jupyter/jupyter_notebook_config.py >> ~/.jupyter/jupyter_notebook_config.py

# jupyterthemes
pip install jupyterthemes
jt -t onedork -cellw 98% -f roboto -fs 10 -nfs 11 -tfs 11 -T
