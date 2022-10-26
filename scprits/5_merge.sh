#!/bin/bash
#Script to merge output files of .fepout
#complex

snumfc=1
enumfc=16

while [[ $snumfc -le $enumfc ]];  
do
cat /home/aistudio/work/T4L/complex/input_files/md_forward_$snumfc.fepout >> complex_forward.fepout 
((snumfc++))
done

snumfcb=1
enumfcb=16

while [[ $snumfcb -le $enumfcb ]];  
do
cat /home/aistudio/work/T4L/complex/input_files/md_backward_$snumfcb.fepout >> complex_backward.fepout 
((snumfcb++))
done

#solvent
snumfs=1
enumfs=16

while [[ $snumfs -le $enumfs ]];  
do
cat /home/aistudio/work/T4L/solvent/input_files/md_forward_$snumfs.fepout >> solvent_forward.fepout 
((snumfs++))
done

snumfsb=1
enumfsb=16

while [[ $snumfsb -le $enumfsb ]];  
do
cat /home/aistudio/work/T4L/solvent/input_files/md_backward_$snumfsb.fepout >> solvent_backward.fepout 
((snumfsb++))
done
