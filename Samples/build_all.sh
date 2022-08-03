#!/bin/bash

export CUDA_PATH=/opt/nvidia/hpc_sdk/Linux_x86_64/21.11/cuda/11.5
export LIBRARY_PATH=$LIBRARY_PATH:/opt/nvidia/hpc_sdk/Linux_x86_64/21.11/math_libs/11.5/targets/x86_64-linux/lib

for test in $(ls */ -d -1); do
  echo $test
  pushd $test
  make clean
  make
  popd
done
