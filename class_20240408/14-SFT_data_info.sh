#!/bin/bash
cp data.json local/app/LLaMA-Factory/data/demo_sft.json

file_sha1=$(sha1sum data.json  | awk '{print $1}')

echo "# Step1: add content to \"local/app/LLaMA-Factory/data/dataset_info.json\" 

  \"demo_sft\": {
    \"file_name\": \"demo_sft.json\",
    \"file_sha1\": \"${file_sha1}\",
    \"columns\": {
      \"prompt\": \"instruction\",
      \"query\": \"input\",
      \"response\": \"output\",
      \"system\": \"system\"	  
    }
  },
"

echo "# Step2: Change HF_TOKEN in 22-1GPU_sft_lora_CUDA.sh"

echo "# Step3: Submit job 22-1GPU_sft_lora_CUDA_srun.sh"
