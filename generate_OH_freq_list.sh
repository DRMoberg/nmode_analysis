#!/bin/bash

nmols=$1
ohl=$((2*${nmols}/3))

tail -$ohl vibfreq.dat > ohfreq.dat
awk '{print $1}' ohfreq.dat > 1.dat
awk '{print $2}' ohfreq.dat > 2.dat
awk '{print $3}' ohfreq.dat > 3.dat

cat 1.dat 2.dat 3.dat > ohlist.dat

sort -n ohlist.dat > OH_freq_list.dat

rm 1.dat 2.dat 3.dat ohlist.dat
