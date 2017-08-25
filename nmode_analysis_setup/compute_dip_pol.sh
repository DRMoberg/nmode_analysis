#!/bin/bash
#PBS -q glean
#PBS -N dip_pol_NNNNNN
#PBS -l nodes=1:ppn=2
#PBS -l walltime=0:30:00
#PBS -o STDOUT
#PBS -e STDERR
#PBS -V
##PBS -M dmoberg@ucsd.edu 
#PBS -m abe

cd $PBS_O_WORKDIR
#run mbmu and mbalpha
 /home/dmoberg/codes/dipole_polarizability_fitting/src/bulk_dip_mbmu POSITION_CMD DIPMOL_CMD DIPIND_CMD > dip_mb.dat &
 /home/dmoberg/codes/dipole_polarizability_fitting/src/bulk_pol_mbalpha POSITION_CMD > pol_mb.dat &

