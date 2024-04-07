#!/bin/bash
srun --job-name demo \
--quit-on-interrupt \
--nodes 1 \
--gpus-per-node 1 \
--cpus-per-task 4 \
--ntasks-per-node 1 \
--account MST110386 \
--partition gp1d \
-o logs/SFT_02.out -e logs/SFT_02.err \
bash -c "./SFT_02-1GPU_sft_qlora_CUDA.sh" &
