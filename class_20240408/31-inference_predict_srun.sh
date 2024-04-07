#!/bin/bash
srun --job-name demo \
--quit-on-interrupt \
--nodes 1 \
--gpus-per-node 1 \
--cpus-per-task 4 \
--ntasks-per-node 1 \
--account MST110386 \
--partition gp1d \
-o logs/31.out -e logs/31.err \
bash -c "./31-inference_predict.sh" &
