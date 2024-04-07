#!/bin/bash
cp 31-predict.sh local/app/LLaMA-Factory/examples/lora_single_gpu/predict_demo.sh

singularity exec --nv --pwd $HOME/.local/app/LLaMA-Factory/examples/lora_single_gpu -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
bash -c 'export PATH=$PATH:$HOME/.local/bin; ./predict_demo.sh'


