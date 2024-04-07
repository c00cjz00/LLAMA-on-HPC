#!/bin/bash
singularity exec --nv --pwd $HOME/.local/app/LLaMA-Factory -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
bash -c "CUDA_VISIBLE_DEVICES=0 python src/evaluate.py \
--model_name_or_path meta-llama/Llama-2-7b-hf \
--adapter_name_or_path saves/LLaMA2-7B/lora/sft \
--template vanilla \
--finetuning_type lora \
--task mmlu \
--split test \
--lang en \
--n_shot 5 \
--batch_size 4"



