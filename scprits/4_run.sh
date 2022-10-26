#!/bin/bash
#Script to start running nvt and npt
#complex
NAMD_3.0alpha8_Linux-x86_64-multicore-CUDA/namd3 +p8  ./complex/input_files/nvt_equil.namd
NAMD_3.0alpha8_Linux-x86_64-multicore-CUDA/namd3 +p8 +setcpuaffinity --CUDASOAintegrate on +devices 0 ./complex/input_files/npt_equil.namd
#solvent
NAMD_3.0alpha8_Linux-x86_64-multicore-CUDA/namd3 +p8  ./solvent/input_files/nvt-equilibration/nvt_equil.namd
NAMD_3.0alpha8_Linux-x86_64-multicore-CUDA/namd3 +p8 +setcpuaffinity --CUDASOAintegrate on +devices 0 ./solvent/input_files/npt-equilibration/npt_equil.namd

#Script to start running
#complex

snumc=1  
enumc=16  

while [[ $snumc -le $enumc ]];  
do
NAMD_3.0alpha8_Linux-x86_64-multicore-CUDA/namd3 +p8 +setcpuaffinity --CUDASOAintegrate on +devices 0 /home/aistudio/wrok/T4L/complex/input_files/md_forward_$snumc.namd
echo "md_forward_$snumc.namd is done." 
((snumc++))  
done  

snumcb=1  
enumcb=16  

while [[ $snumcb -le $enumcb ]];  
do
NAMD_3.0alpha8_Linux-x86_64-multicore-CUDA/namd3 +p8 +setcpuaffinity --CUDASOAintegrate on +devices 0 /home/aistudio/wrok/T4L/complex/input_files/md_backward_$snumcb.namd
echo "md_backward_$snumcb.namd is done."  
((snumcb++))  
done


#Script to merge output files of .fepout
#complex

snums=1  
enums=16  

while [[ $snums -le $enums ]];  
do
NAMD_3.0alpha8_Linux-x86_64-multicore-CUDA/namd3 +p8 +setcpuaffinity --CUDASOAintegrate on +devices 0 /home/aistudio/work/T4L/solvent/input_files/md_forward_$snums.namd
echo "md_forward_$snums.namd is done."  
((snums++))  
done  

snumsb=1  
enumsb=16  

while [[ $snumsb -le $enumsb ]];  
do
NAMD_3.0alpha8_Linux-x86_64-multicore-CUDA/namd3 +p8 +setcpuaffinity --CUDASOAintegrate on +devices 0 /home/aistudio/work/T4L/solvent/input_files/md_backward_$snumsb.namd
echo "md_backward_$snumsb.namd is done."  
((snumsb++))  
done
