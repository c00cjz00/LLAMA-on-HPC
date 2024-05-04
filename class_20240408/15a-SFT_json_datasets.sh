#!/bin/bash
mkdir -p local/app/python/

cp 15a-SFT_identity.json local/app/python/
cp 15a-SFT_json_datasets.py local/app/python/

singularity exec --nv --pwd $HOME/.local/app/python -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
bash -c 'python 15a-SFT_json_datasets.py'

mv local/app/python/data.json .
sha1sum data.json


