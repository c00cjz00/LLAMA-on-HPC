#!/bin/bash
srun --job-name demo \
--quit-on-interrupt \
--nodes 1 \
--gpus-per-node 1 \
--cpus-per-task 4 \
--ntasks-per-node 1 \
--account MST110386 \
--partition gp1d \
-o logs/20b.out -e logs/20b.err \
bash -c "./20b-webui.sh" &
