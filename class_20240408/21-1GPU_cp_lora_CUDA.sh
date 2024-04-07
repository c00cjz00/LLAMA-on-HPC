#!/bin/bash
cp 21-pretrain.sh local/app/LLaMA-Factory/examples/lora_single_gpu/pretrain_demo.sh

singularity exec --nv --pwd $HOME/.local/app/LLaMA-Factory/examples/lora_single_gpu -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
bash -c "HF_TOKEN=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 bash pretrain_demo.sh"
