#!/bin/bash
mkdir -p local/app cache/

singularity exec --nv --pwd $HOME/.local/app -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
bash -c "git clone https://github.com/hiyouga/LLaMA-Factory.git; \
pip install -r LLaMA-Factory/requirements.txt"

