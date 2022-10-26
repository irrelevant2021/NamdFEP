#!/bin/bash
#0.3ns nvt and 0.3ns npt
sed -i  's/set numSteps            500000/set numSteps            150000/'  ./complex/input_files/nvt_equil.namd # numSteps
sed -i  's/set numMinSteps         50000/set numMinSteps         10000/'  ./complex/input_files/nvt_equil.namd # numMinSteps, not supported by GPU
sed -i  's/set numSteps            500000/set numSteps            150000/'  ./complex/input_files/npt_equil.namd # numSteps
#same for solvent
sed -i  's/set numSteps            500000/set numSteps            150000/'  ./solvent/input_files/nvt-equilibration/nvt_equil.namd # numSteps
sed -i  's/set numMinSteps         50000/set numMinSteps         10000/'  ./solvent/input_files/nvt-equilibration/nvt_equil.namd # numMinSteps, not supported by GPU
sed -i  's/set numSteps            500000/set numSteps            150000/'  ./solvent/input_files/npt-equilibration/npt_equil.namd # numSteps

#every λ run for 1 ns, but you also need to change some reportly parameter for avoiding unnecessary error.
sed -i  's/250000/25000/'  ./complex/input_files/md_*.namd # OUTPUT FREQUENCIES
sed -i  's/run		        5000000/run		        500000/g'  ./complex/input_files/md_*.namd  # run
sed -i  's/alchEquilSteps          500000/alchEquilSteps          50000/g'  ./complex/input_files/md_*.namd  # alchEquilSteps

#same for solvent
sed -i  's/250000/25000/'  ./solvent/input_files/md_*.namd # OUTPUT FREQUENCIES
sed -i  's/run		        5000000/run		        500000/g'  ./solvent/input_files/md_*.namd  # run
sed -i  's/alchEquilSteps          500000/alchEquilSteps          50000/g'  ./solvent/input_files/md_*.namd  # alchEquilSteps


#This is an additional setting only for this system.
sed -i  's/timestep                2.0/timestep                1.0/g'  ./solvent/input_files/md_backward_16.namd