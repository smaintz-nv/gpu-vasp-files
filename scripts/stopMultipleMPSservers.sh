#!/bin/bash
for GPU in `nvidia-smi --format=csv,noheader --query-gpu=uuid`;
do
 echo stopping mps server for $GPU
 export CUDA_MPS_PIPE_DIRECTORY=/tmp/mymps_$GPU
 echo 'quit' | nvidia-cuda-mps-control
 rm -rf /tmp/mymps_$GPU
 rm -rf /tmp/mymps_log_$GPU
done
