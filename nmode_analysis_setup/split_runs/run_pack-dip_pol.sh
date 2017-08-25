#!/bin/bash

EXEdipmb=/home/dmoberg/codes/dipole_polarizability_fitting/src/bulk_dip_mbmu
EXEpolmb=/home/dmoberg/codes/dipole_polarizability_fitting/src/bulk_pol_mbalpha

for i in `seq $1 1 $2`; do
  cd ../freq_$i
  $EXEdipmb POSITION_CMD DIPMOL_CMD DIPIND_CMD > dip_mb.dat &
  $EXEpolmb POSITION_CMD > pol_mb.dat &
  cd ../split_runs
done
wait

