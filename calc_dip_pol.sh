#!/bin/bash

# 3rd script to run
# Generates instantaneous dipole and polarizability derivative approximations

s=$1
t=$2
nmol=360

   #calculates numerical derivative of each dipole moment and polarizability wrt coordinate change
for ((i=$s;i<=$t;i++)); do
    cd freq_$i
    paste dip_mb.dat ../initial/dip_mb.dat > dip_add_$i
    awk '{print ($2 - $7)*($2 - $7) + ($3 - $8)*($3 - $8) + ($4 - $9)*($4 - $9)}' dip_add_$i > ir_$i
    
    paste pol_mb.dat ../initial/pol_mb.dat > pol_add_$i
#    paste pol_1b.dat ../initial/pol_1b.dat > pol_add_$i
    awk '{print (($2 + $5 + $7)/3.0 - ($9 + $12 + $14)/3.0)^2}' pol_add_$i > iso_$i
    awk '{print ($2 - ($2+$5+$7)/3.0)^2 + ($5 - ($2+$5+$7)/3.0)^2 + ($7 - ($2+$5+$7)/3.0)^2 + 2*($3*$3) + 2*($4*$4) + 2*($6*$6) - (($9 - ($9+$12+$14)/3.0)^2 + ($12 - ($9+$12+$14)/3.0)^2 + ($14 - ($9+$12+$14)/3.0)^2 + 2*($10*$10) + 2*($11*$11) + 2*($13*$13))}' pol_add_$i > dep_$i
    cd ..
done

rm ir.dat iso.dat dep.dat

for ((i=$s;i<=$t;i++)); do
   cat freq_$i/ir_$i >> ir.dat
   cat freq_$i/iso_$i >> iso.dat
   cat freq_$i/dep_$i >> dep.dat
done

#./generate_OH_freq_list.dat ${nmol}

paste OH_freq_list.dat ir.dat > OH_ir.dat
paste OH_freq_list.dat iso.dat > OH_iso.dat
paste OH_freq_list.dat dep.dat > OH_dep.dat
#paste ir.dat iso.dat dep.dat > no_freqs.dat
