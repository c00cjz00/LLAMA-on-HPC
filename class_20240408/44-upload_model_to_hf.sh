#!/bin/bash
singularity exec --nv --pwd $HOME/.local/app/LLaMA-Factory -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
bash -c "export PATH=$PATH:$HOME/.local/bin; \
HUGGING_FACE_HUB_TOKEN=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 HF_HUB_ENABLE_HF_TRANSFER=1 \
huggingface-cli upload c00cjz00/demo models/llama2-7b-sft.gguf lama2-7b-sft.gguf"

