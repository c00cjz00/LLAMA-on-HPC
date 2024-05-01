#!/bin/bash
## 啟動 vllm api
#GPUs
gpu_nums=2

# model 請修改以下模型位置或提供 hf repo_id
model_id=taide/Llama3-TAIDE-LX-8B-Chat-Alpha1

# HF_TOKEN 請修改以下HF_TOKEN
HF_TOKEN=hf_

# Docker Image
image=/work/u00cjz00/nvidia/cuda118/worker-vllm_stable-cuda11.8.0.sif 

# IP
node_ip=$(cat /etc/hosts |grep "$(hostname -a)" | awk '{print $1}')
# PORT
noed_port=$(python -c "import socket; s = socket.socket(socket.AF_INET, socket.SOCK_STREAM); s.bind(('', 0)); addr = s.getsockname(); s.close(); print(addr[1])")
# PROXY
proxy_url=/rstudio/${node_ip}/${noed_port}
# URL
https_url=https://node01.biobank.org.tw${proxy_url}/

# CLEAN
ps -ef |grep vllm.entrypoints | awk '{print $2}' | xargs kill -9
sleep 1

#連線網址
echo "連線網址: ${https_url}v1"
echo "模型網址: ${https_url}v1/models"

# 啟動程式
# vllm.entrypoints.openai.api_server
# vllm.entrypoints.api_server
mkdir -p vllm_local vllm_cache vllm_hub
#export TRANSFORMERS_CACHE=$HOME/.cache
export HF_HOME=$HOME/.cache
singularity exec --nv --pwd $HOME/.local -B ./vllm_hub:/runpod-volume/huggingface-cache/hub -B ./vllm_local:$HOME/.local -B ./vllm_cache:$HOME/.cache \
$image \
bash -c "HF_TOKEN=$HF_TOKEN python3 -m vllm.entrypoints.openai.api_server \
--dtype half \
--host $node_ip \
--port $noed_port \
--root-path $proxy_url \
--download-dir ./models \
--model $model_id \
--tensor-parallel-size $gpu_nums"
