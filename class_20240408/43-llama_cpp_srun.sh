#!/bin/bash
srun --job-name demo \
--quit-on-interrupt \
--nodes 1 \
--gpus-per-node 1 \
--cpus-per-task 4 \
--ntasks-per-node 1 \
--account MST110386 \
--partition gp1d \
-o logs/43.out -e logs/43.err \
bash -c "./43-llama_cpp.sh" &
