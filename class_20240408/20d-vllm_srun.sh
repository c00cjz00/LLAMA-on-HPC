#!/bin/bash
srun --job-name vllm \
--quit-on-interrupt \
--nodes 1 \
--gpus-per-node 1 \
--cpus-per-task 4 \
--ntasks-per-node 1 \
--account MST110386 \
--partition gp1d \
-o logs/20d.out -e logs/20d.err \
bash -c "./20d-vllm.sh" &
