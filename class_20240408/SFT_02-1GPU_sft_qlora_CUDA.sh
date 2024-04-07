#!/bin/bash
cp SFT_02-bitsandbytes.sh local/app/LLaMA-Factory/examples/qlora_single_gpu/bitsandbytes_demo.sh

singularity exec --nv --pwd $HOME/.local/app/LLaMA-Factory/examples/qlora_single_gpu -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
bash -c "HF_TOKEN=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 bash bitsandbytes_demo.sh"
