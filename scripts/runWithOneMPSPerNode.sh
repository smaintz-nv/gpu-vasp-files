#!/bin/bash
runCommand="$HOME/bin/vasp_gpu"

# Irank=$OMPI_COMM_WORLD_LOCAL_RANK
globalMPIRank=$PMI_RANK
numberOfNodes=$I_MPI_INFO_NP
ranksPerNode=`echo $PMI_SIZE / $numberOfNodes | bc`
Irank=`echo $globalMPIRank % $ranksPerNode |bc`

if [ "$Irank" == "0" ]
then
  echo "starting mps"
  export CUDA_MPS_PIPE_DIRECTORY=/tmp/nvidia-mps
  export CUDA_MPS_LOG_DIRECTORY=/tmp/nvidia-log
  taskset 0xFFFFFFFF nvidia-cuda-mps-control -d
fi

$runCommand

if [ "$Irank" == "0" ]
then
  echo "stopping mps"
  echo quit | nvidia-cuda-mps-control
fi
