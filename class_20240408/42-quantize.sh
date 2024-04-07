#!/bin/bash
singularity exec --nv --pwd $HOME/.local/app/LLaMA-Factory -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
bash -c "CUDA_VISIBLE_DEVICES=0 python src/export_model.py \
--model_name_or_path models/llama2-7b-sft \
--template default \
--export_dir models/llama2-7b-sft-int4 \
--export_quantization_bit 4 \
--export_quantization_dataset data/c4_demo.json \
--export_size 1 \
--export_legacy_format False"





