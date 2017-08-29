#!/bin/bash
for GPU in `nvidia-smi --format=csv,noheader --query-gpu=uuid`;
do
sudo nvidia-smi -i $GPU -c DEFAULT
done
