#!/bin/bash
cp 24-orpo.sh local/app/LLaMA-Factory/examples/lora_single_gpu/orpo_demo.sh

singularity exec --nv --pwd $HOME/.local/app/LLaMA-Factory/examples/lora_single_gpu -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
bash -c "HF_TOKEN=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 bash orpo_demo.sh"
