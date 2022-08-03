#!/bin/bash

SAMPLES_DIR=/pscratch/sd/c/cchan2/projects/external/cuda-samples/Samples
export NVBIT_DIR=/pscratch/sd/c/cchan2/projects/external/nvbit_release

for test in $(ls * -d -1); do
  if [ -d $test -a -f $test/$test ]; then
    echo $test
    pushd $test
    export test
    timeout 2m bash ${SAMPLES_DIR}/run_test.sh
    if [ -e sstprospero-0-0-bin.trace ]; then 
      echo "Moving trace files ..."
      mkdir -p ../traces/$test
      mv sstprospero*.trace ../traces/$test/
      mv run.out ../traces/$test/
    fi
    popd
  fi
done
