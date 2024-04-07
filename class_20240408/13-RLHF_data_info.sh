#!/bin/bash
cp data.json local/app/LLaMA-Factory/data/demo_rlhf.json

file_sha1=$(sha1sum data.json  | awk '{print $1}')

echo "# Step1: add content to \"local/app/LLaMA-Factory/data/dataset_info.json\" 

  \"demo_rlhf\": {
    \"file_name\": \"demo_rlhf.json\",
    \"file_sha1\": \"${file_sha1}\",
    \"ranking\": true,	
    \"columns\": {
      \"prompt\": \"question\", 
      \"response\": \"answer\", 
      \"system\": \"system\"
    }
  },
"

echo "# Step2: Change HF_TOKEN in 23-1GPU_dpo_lora_CUDA.sh"
echo "# Step3: Submit job 23-1GPU_dpo_lora_CUDA_srun.sh"
echo ""
echo "or"
echo ""
echo "# Step2: Change HF_TOKEN in 24-1GPU_orpo_lora_CUDA.sh"
echo "# Step3: Submit job 24-1GPU_orpo_lora_CUDA_srun.sh"
