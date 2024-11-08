# DOCKER IMAGE BUILDING
```
# docker build -t c00cjz00/c00cjz00_pytorch:2.4.0-cuda11.8-cudnn9-devel .
# docker run -d --name llama-factory c00cjz00/c00cjz00_pytorch:2.4.0-cuda11.8-cudnn9-devel
# docker exec -it llama-factory bash
# docker build -t c00cjz00/c00cjz00_pytorch:2.4.0-cuda12.1-cudnn9-devel .
# docker run -d --name llama-factory2 c00cjz00/c00cjz00_pytorch:2.4.0-cuda12.1-cudnn9-devel
# docker exec -it llama-factory2 bash

cd /workspace
git clone --depth 1 https://github.com/hiyouga/LLaMA-Factory.git
cd LLaMA-Factory/
pip install -r requirements.txt
pip install .[deepspeed,metrics,bitsandbytes]
#git clone https://github.com/ggerganov/llama.cpp.git
#pip install -r llama.cpp/requirements.txt


#echo "deb http://th.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list
#apt update
#apt install libc6
#strings /lib/x86_64-linux-gnu/libc.so.6 |grep GLIBC_
#add-apt-repository -y ppa:ubuntu-toolchain-r/test
#sudo apt install -y g++-11
#strings /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep GLIBCXX


#docker commit llama-factory c00cjz00/c00cjz00_pytorch:2.4.0-cuda11.8-cudnn9-devel
#docker commit llama-factory2 c00cjz00/c00cjz00_pytorch:2.4.0-cuda12.1-cudnn9-devel

#docker login -u c00cjz00

#docker push c00cjz00/c00cjz00_pytorch:2.4.0-cuda11.8-cudnn9-devel
#docker push c00cjz00/c00cjz00_pytorch:2.4.0-cuda12.1-cudnn9-devel


```

# Singularity
```
#singularity pull docker://c00cjz00/c00cjz00_pytorch:2.4.0-cuda11.8-cudnn9-devel
#singularity shell --nv /work/u00cjz00/nvidia/cuda118/c00cjz00_pytorch_2.4.0-cuda11.8-cudnn9-devel.sif

singularity pull docker://c00cjz00/c00cjz00_pytorch:2.4.0-cuda12.1-cudnn9-devel
singularity shell --nv /work/u00cjz00/nvidia/cuda12/c00cjz00_pytorch_2.4.0-cuda12.1-cudnn9-devel.sif

cd ~/
git clone https://github.com/hiyouga/LLaMA-Factory.git
cd ~/LLaMA-Factory
HF_TOKEN=hf_  llamafactory-cli train examples/train_lora/llama3_lora_sft.yaml
HF_TOKEN=hf_ GRADIO_SHARE=1 llamafactory-cli webui
watch -n0 nvidia-smi
```

