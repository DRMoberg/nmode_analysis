#!/bin/bash

# 2nd script to run

# Runs 16 normal mode trajectories per job, e.g.:
# 2515-2530
# 2531-2546
# etc...

s=$1
t=$2

count=0

for i in `seq $s 16 $t`; do
  ./run_dip_pol.sh $(($s+$count*16)) $(($s+15+$count*16))
  count=$(($count+1))
done
