#!/bin/bash
srun --job-name demo \
--quit-on-interrupt \
--nodes 1 \
--gpus-per-node 4 \
--cpus-per-task 16 \
--ntasks-per-node 1 \
--account MST110386 \
--partition gp1d \
-o logs/SFT_03.out -e logs/SFT_03.err \
bash -c "./SFT_03-1Node_nGPUs_sft_lora_Accelerate.sh" &
