#!/bin/bash
mkdir -p local/app cache/

singularity exec --nv --pwd $HOME/.local/app -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
bash -c "git clone https://github.com/ggerganov/llama.cpp.git; \
pip install -r llama.cpp/requirements.txt"

singularity exec --nv --pwd $HOME/.local/app -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
pip install protobuf==5.26.1 sentencepiece==0.2.0

