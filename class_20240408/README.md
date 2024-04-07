# LLAMA-on-HPC class_20240408
## 登入HPC, 請將$ACCOUNT改為你的帳號
```
ssh $ACCOUNT@ln01.twcc.ai
```
## 下載程式碼
- 下載程式碼
```
mkdir /work/$(whoami)/github
cd /work/$(whoami)/github
git clone https://github.com/c00cjz00/LLAMA-on-HPC.git
```
- 更換 HF_TOKEN
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
sed -i 's/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/hf_xxxxxxxxxxxxxxxxxxxxxxx/g' *sh
```
- 更換計畫代號
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
sed -i 's/MST110386/MSTxxxxxx/g' /*sh
```

## 容器映像檔下載
- 下載容器映像檔
```
#下載容器映像檔
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./01a-download_docker_image.sh

#清除映像檔Cache 
echo y | singularity cache clean
```
- 或直接複製容器映像檔
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./01b-copy_docker_image.sh
```

## Install 安裝套件
```
# 切換目錄
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/

# Base packages (必要安裝)
./02-install_package.sh

# Extention packages (必要安裝)
./03-extention_package.sh

# Predict.sh packages (可不安裝)
./04-predict_package.sh

# llama_cpp packages (可不安裝)
./05-install_llama_cpp.sh
```

## Singularity 容器操作練習
- Execute command with Singularity
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./06-singularity_exec.sh
```
- Interactive with Singularity
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./06-singularity_interactive.sh
```

## Slurm 工作派送操作練習
- Queue, SBATCH
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./07-srun_queue.sh
```
- Interactive, SRUN
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./07-srun_interactive.sh
```

## Dataset
包含 CP, SFT, RLHF 資料集

### 1. 建立模型預訓練資料 (PRE-TRAINING)
- 執行程式 (更改資料請編修 11-CP_hf_datasets.py )
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./11-CP_hf_datasets.sh
```
- 上架資料 (請根據輸出內容, 編修 local/app/LLaMA-Factory/data/dataset_info.json)
```
./11-CP_data_info.sh
```

### 2. 建立模型對話微調資料 (SFT)
- 執行程式 (更改資料請編修 12-SFT_hf_datasets.py )
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./12-SFT_hf_datasets.sh
```
- 上架資料 (請根據輸出內容, 編修 local/app/LLaMA-Factory/data/dataset_info.json)
```
./12-SFT_data_info.sh
```

### 3. 建立模型對齊微調資料 (RLHF)
- 執行程式 (更改資料請編修 13-RLHF_hf_datasets.py )
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./13-RLHF_hf_datasets.sh
```
- 上架資料 (請根據輸出內容, 編修 local/app/LLaMA-Factory/data/dataset_info.json)
```
./13-RLHF_data_info.sh
```


## Model 模型處理

### 1. 模型下載
- 執行程式
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
20a-download_model_from_hf.sh
```
- 模型儲存於 cache/huggingface/hub/
- 更改模型請編修 20a-download_model_from_hf.sh
### 2. WebUI
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./20b-webui_srun.sh
```
- 執行完成後請 cat logs/20b.out , 取得WEBUI IP

### 3. 查閱模型所需要的硬體資源
- 執行程式 ( 執行完成後請 cat logs/2c.out , 查閱模型所需要的硬體資源 )
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./20c-Hardware_Requirement_srun.sh
```
- 更換模型內容, 請修改 20c-Hardware_Requirement.py


## 模型訓練 (LORA)
以下採用 lora 參數降階模式訓練 (約原始模型參數1/1000)

### 1. 預訓練 PRE-TRAINING
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./21-1GPU_cp_lora_CUDA_srun.sh
```
- 更動訓練內容請編修以下程式
```
21-1GPU_cp_lora_CUDA.sh

21-pretrain.sh
```

### 2. 指令微調 SFT
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./22-1GPU_sft_lora_CUDA_srun.sh
```
- 更動訓練內容請編修以下程式
```
22-1GPU_sft_lora_CUDA.sh

22-sft.sh
```

### 3. 對齊微調 DPO
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./23-1GPU_dpo_lora_CUDA_srun.sh
```
- 更動訓練內容請編修以下程式
```
23-1GPU_dpo_lora_CUDA.sh

23-dpo.sh
```

### 4. 對齊微調 ORPO
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./24-1GPU_orpo_lora_CUDA_srun.sh
```
- 更動訓練內容請編修以下程式
```
24-1GPU_orpo_lora_CUDA.sh

24-orpo.sh
```

## 模型使用 (Inference)
以下使用原始模型外掛lora方式

### 1. 自動資料集評估預測
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./31-inference_predict_srun.sh
```
- 更動預測內容請編修以下程式
```
31-inference_predict.sh

31-predict.sh
```

### 2. 公用資料集評估預測
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./32-inference_evalute_srun.sh
```
- 更動預測內容請編修以下程式
```
32-inference_evalute.sh
```

### 3. Inference cli
- 建議先執行 06-srun_interactive.sh , 進入計算結點, 在執行以下程式內容
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./33-inference_cli.sh
```


## 模型合併與量化

### 1. Merage lora
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./41-merage_lora_srun.sh
```
- 更動合併內容請編修以下程式
```
41-merage_lora.sh
```

### 2. Quantize
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./42-quantize_srun.sh
```
- 更動量化內容請編修以下程式
```
42-quantize.sh
```

### 3. llama cpp
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./43-llama_cpp_srun.sh
```
- 更動量化內容請編修以下程式
```
43-llama_cpp.sh
```

### 4. 模型上傳至HF
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./44-upload_model_to_hf.sh
```
- 更動上傳內容請編修以下程式
```
44-upload_model_to_hf.sh
```


## HPC節點模型訓練方法

### 1. SFT LORA   (1GPU)
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./SFT_01-1GPU_sft_lora_CUDA_srun.sh
```
- 更動訓練內容請編修以下程式
```
SFT_01-1GPU_sft_lora_CUDA.sh

SFT_01-sft.sh
```

### 2. SFT QLORA  (1GPU)
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./SFT_02-1GPU_sft_qlora_CUDA_srun.sh
```
- 更動訓練內容請編修以下程式
```
SFT_02-1GPU_sft_qlora_CUDA.sh

SFT_02-bitsandbytes.sh
```

### 3. SFT LORA+ Accelerate  (nGPUs)
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./SFT_03-1Node_nGPUs_sft_lora_Accelerate_srun.sh
```
- 更動訓練內容請編修以下程式
```
SFT_03-1Node_nGPUs_sft_lora_Accelerate.sh

SFT_03-single_node.sh
```

### 4. SFT FULL+ Deepspeed  (nGPUs)
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./SFT_04-1Node_nGPUs_sft_full_Deepspeed_srun.sh
```
- 更動訓練內容請編修以下程式
```
SFT_04-1Node_nGPUs_sft_full_Deepspeed.sh

SFT_04-single_node.sh
```

### 5. SFT FULL+ Deepspeed  (nNodes+nGPUs)
- 執行程式 
```
cd /work/$(whoami)/github/LLAMA-on-HPC/class_20240408/
./SFT_05-nNode_nGPUs_sft_full_Deepspeed_srun.sh
```
- 更動訓練內容請編修以下程式
```
SFT_05-nNode_nGPUs_sft_full_Deepspeed.sh

SFT_05-multi_node.sh
```

## 其他資料訊息

### 1. 錯誤訊息
- 硬碟滿了
```
Failed to build fire
ERROR: Could not build wheels for fire, which is required to install pyproject.toml-based projects
```

### 2. 訓練資料儲存位置
```
local/app/LLaMA-Factory/save
```

### 3. HF模型與資料下載儲存位置
```
cache/huggingface/
```

### 4. Slurm logs 儲存位置
```
cache/huggingface/
```

