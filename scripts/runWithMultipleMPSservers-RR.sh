#!/bin/bash
runCommand="$HOME/bin/vasp_gpu"

# this can run with the following command
# mpirun --rankfile rankfile --report-bindings ./runWithMultipleMPSservers.csh
export CUDA_VISIBLE_DEVICES=0
# Irank=$OMPI_COMM_WORLD_LOCAL_RANK
Irank=$PMI_RANK
mpsPipeDirPref="/tmp/mymps_"

declare -a pipeDir
for GPU in `nvidia-smi --format=csv,noheader --query-gpu=index`
do
uuid=`nvidia-smi --format=csv,noheader --query-gpu=uuid -i $GPU`
pipeDir[GPU]=$mpsPipeDirPref$uuid
done

myMpsInstance=`echo $Irank % ${#pipeDir[@]} | bc`
#echo pipeDir length ${#pipeDir[@]}
#echo rank $Irank instance $myMpsInstance
export CUDA_MPS_PIPE_DIRECTORY=${pipeDir[$myMpsInstance]}
echo $CUDA_MPS_PIPE_DIRECTORY
$runCommand

