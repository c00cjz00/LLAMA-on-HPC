#!/bin/bash
mkdir -p local/app cache/ conda/

singularity exec --nv --pwd $HOME/.local/app -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
bash -c "git clone --depth 1 --branch v0.7.0 https://github.com/hiyouga/LLaMA-Factory.git; \
cd LLaMA-Factory; \
pip install .[bitsandbytes]"
