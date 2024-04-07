#!/bin/bash
srun --job-name demo \
--quit-on-interrupt \
--nodes 1 \
--gpus-per-node 1 \
--cpus-per-task 4 \
--ntasks-per-node 1 \
--account MST110386 \
--partition gp1d \
-o logs/SFT_01.out -e logs/SFT_01.err \
bash -c "./SFT_01-1GPU_sft_lora_CUDA.sh" &
