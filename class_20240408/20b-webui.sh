#!/bin/bash
## 啟動 Llama-Factory Web UI
## 請記得修改最後一行, 給予huggingface token,  HF_TOKEN='hf_' ?
## 記錄檔案為 llamafactory.log 

# IP
node_ip=$(cat /etc/hosts |grep "$(hostname -a)" | awk '{print $1}')
# PORT
noed_port_genai=$(python -c "import socket; s = socket.socket(socket.AF_INET, socket.SOCK_STREAM); s.bind(('', 0)); addr = s.getsockname(); s.close(); print(addr[1])")
# PROXY
proxy_url=/rstudio/${node_ip}/${noed_port_genai}
# URL
https_url=https://node01.biobank.org.tw${proxy_url}/

# SCRIPT FILE
cat << EOF >  local/app/LLaMA-Factory/src/train_web_demo.py
from llmtuner import create_ui
import os
os.environ["WANDB_DISABLED"] = "true"

#print("${https_url}")

def main():
    demo = create_ui()
    demo.queue()
    demo.launch(server_port=${noed_port_genai}, server_name="$(hostname -s)", share=False, inbrowser=True, root_path="${proxy_url}", auth=("nchc", "nchcorgtw"))

if __name__ == "__main__":
    main()
EOF

# 參除
ps -ef |grep train_web_demo | awk '{print $2}' | xargs kill -9
sleep 1

#請更新以下 HF_TOKEN
echo $https_url
echo "Account: nchc"
echo "Password: nchcorgtw"

singularity exec --nv --pwd $HOME/.local/app/LLaMA-Factory -B ./local:$HOME/.local -B ./cache:$HOME/.cache \
images/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel.sif \
bash -c "CUDA_VISIBLE_DEVICES=0 HF_TOKEN=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 python src/train_web_demo.py"
