#!/bin/bash

s=$1
t=$2
       cd initial/
       if grep -q 'OpenFabric' dip_mb.dat
       then
          mv dip_mb.dat old_dip_mb.dat
          tail -1 old_dip_mb.dat > dip_mb.dat
       fi
       if grep -q 'OpenFabric' pol_mb.dat
       then
          mv pol_mb.dat old_pol_mb.dat
          tail -1 old_pol_mb.dat > pol_mb.dat
       fi
       cd ..

    for ((i=$s;i<=$t;i++)); do
       cd freq_$i/
       if grep -q 'OpenFabric' dip_mb.dat
       then
          mv dip_mb.dat old_dip_mb.dat
          tail -1 old_dip_mb.dat > dip_mb.dat
       fi
       if grep -q 'OpenFabric' pol_mb.dat
       then
          mv pol_mb.dat old_pol_mb.dat
          tail -1 old_pol_mb.dat > pol_mb.dat
       fi
       cd ..
    done

