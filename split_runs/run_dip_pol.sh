#!/bin/bash

s=$1
t=$2

cat run_set.job | sed "s/XXXXXX/.\/run_pack-dip_pol.sh "$s" "$t"/g" | sed "s/NNNNNN/"$s"/g" | sed "s/MMMMMM/"$t"/g" > tscc_$1-$2.job
qsub tscc_$1-$2.job

