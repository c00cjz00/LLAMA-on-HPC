#!/bin/bash
srun --job-name demo \
--quit-on-interrupt \
--nodes 1 \
--gpus-per-node 4 \
--cpus-per-task 16 \
--ntasks-per-node 1 \
--account MST110386 \
--partition gp1d \
-o logs/SFT_04.out -e logs/SFT_04.err \
bash -c "./SFT_04-1Node_nGPUs_sft_full_Deepspeed.sh" &
