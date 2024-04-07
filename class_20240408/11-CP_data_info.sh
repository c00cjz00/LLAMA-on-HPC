#!/bin/bash
cp data.json local/app/LLaMA-Factory/data/demo_cp.json

file_sha1=$(sha1sum data.json  | awk '{print $1}')

echo "# Step1: add content to \"local/app/LLaMA-Factory/data/dataset_info.json\" 

  \"demo_cp\": {
    \"file_name\": \"demo_cp.json\",
    \"file_sha1\": \"${file_sha1}\",
    \"columns\": {
      \"prompt\": \"text\"  
    }
  },
"

echo "# Step2: Change HF_TOKEN in 21-1GPU_cp_lora_CUDA.sh"

echo "# Step3: Submit job 21-1GPU_cp_lora_CUDA_srun.sh"
