#!/bin/bash
#unzip ligand0_ligand1_07112022051655.zip

cp par_opls_aam.inp ./complex
cp updated.prm ./complex
cp reference.prm ./complex
cp fep.tcl ./complex

cp par_opls_aam.inp ./solvent
cp updated.prm ./solvent
cp reference.prm ./solvent
cp fep.tcl ./solvent

mkdir ./complex/input_files
mv ./complex/complex-input-files.tar.gz ./complex/input_files
tar -xvf ./complex/input_files/complex-input-files.tar.gz -C ./complex/input_files

mkdir ./solvent/input_files
mv ./solvent/solvent-input-files.tar.gz ./solvent/input_files
tar -xvf ./solvent/input_files/solvent-input-files.tar.gz -C ./solvent/input_files
