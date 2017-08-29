#!/bin/bash
for GPU in `nvidia-smi --format=csv,noheader --query-gpu=uuid`;
do
 echo starting mps server for $GPU
 mkdir /tmp/mymps_$GPU
 mkdir /tmp/mymps_log_$GPU
 export CUDA_VISIBLE_DEVICES=$GPU
 export CUDA_MPS_PIPE_DIRECTORY=/tmp/mymps_$GPU
 export CUDA_MPS_LOG_DIRECTORY=/tmp/mymps_log_$GPU
 nvidia-cuda-mps-control -d
done

