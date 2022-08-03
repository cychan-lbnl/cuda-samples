#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/nvidia/hpc_sdk/Linux_x86_64/21.11/math_libs/11.5/targets/x86_64-linux/lib
export LD_PRELOAD=${NVBIT_DIR}/tools/mem_trace/mem_trace.so
./$test 2>&1 | tee run.out
