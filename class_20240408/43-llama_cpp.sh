#!/bin/bash
#git clone https://github.com/ggerganov/llama.cpp.git
#pip install -r llama.cpp/requirements.txt
# Q8_0,Q6_K_M和Q4_K_M
singularity exec --nv --pwd $HOME/.local/app -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
python3 llama.cpp/convert.py \
LLaMA-Factory/models/llama2-7b-sft \
--outfile LLaMA-Factory/models/llama2-7b-sft_q2.gguf \
--outtype q8_0

