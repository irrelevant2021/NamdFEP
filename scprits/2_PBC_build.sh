#!/bin/bash
cd ./complex/input_files

cp nvt_equil.namd nvt_equil.namd.bak
cp ./../min-max_center ./min-max_center.tmp

sed -i "s/{//g" ./min-max_center.tmp
sed -i "s/}//g" ./min-max_center.tmp

cat min-max_center.tmp | cut -d " " -f 1 | head -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 2 | head -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 3 | head -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 4 | head -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 5 | head -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 6 | head -n 1 >> PBC.tmp


x2=$(cat PBC.tmp | head -n 4 | tail -n 1)
#echo $x2
x1=$(cat PBC.tmp | head -n 1 | tail -n 1)
#echo $x1
awk 'BEGIN{print int("'$x2'" - "'$x1'" + 1)}' > PBC_x.tmp
#cat PBC_x.tmp
touch PBC_namd_x.tmp
echo "cellbasisvector1         PBC_x     0     0" > PBC_namd_x.tmp
sed -i  "s/PBC_x/$(cat PBC_x.tmp)/" PBC_namd_x.tmp
echo "the x-axis of your system is："
cat PBC_namd_x.tmp
sed -i "63c $(cat PBC_namd_x.tmp)" nvt_equil.namd 


y2=$(cat PBC.tmp | head -n 5 | tail -n 1)
#echo $y2
y1=$(cat PBC.tmp | head -n 2 | tail -n 1)
#echo $y1
awk 'BEGIN{print int("'$y2'" - "'$y1'" + 1)}' > PBC_y.tmp
#cat PBC_y.tmp
touch PBC_namd_y.tmp
echo "cellbasisvector2         0     PBC_y     0" > PBC_namd_y.tmp
sed -i  "s/PBC_y/$(cat PBC_y.tmp)/" PBC_namd_y.tmp
echo "the y-axis of your system is："
cat PBC_namd_y.tmp
sed -i "64c $(cat PBC_namd_y.tmp)" nvt_equil.namd 


z2=$(cat PBC.tmp | head -n 6 | tail -n 1)
#echo $z2
z1=$(cat PBC.tmp | head -n 3 | tail -n 1)
#echo $z1
awk 'BEGIN{print int("'$z2'" - "'$z1'" + 1)}' > PBC_z.tmp
#cat PBC_z.tmp
touch PBC_namd_z.tmp
echo "cellbasisvector3         0     0     PBC_z" > PBC_namd_z.tmp
sed -i  "s/PBC_z/$(cat PBC_z.tmp)/" PBC_namd_z.tmp
echo "the z-axis of your system is："
cat PBC_namd_z.tmp
sed -i "65c $(cat PBC_namd_z.tmp)" nvt_equil.namd 

cat min-max_center.tmp | cut -d " " -f 1 | tail -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 2 | tail -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 3 | tail -n 1 >> PBC.tmp

x=$(cat PBC.tmp | head -n 7 | tail -n 1)
y=$(cat PBC.tmp | head -n 8 | tail -n 1)
z=$(cat PBC.tmp | head -n 9 | tail -n 1)

awk 'BEGIN{printf "%.1f\n",('$x')}' > PBC_center_x.tmp
awk 'BEGIN{printf "%.1f\n",('$y')}' > PBC_center_y.tmp
awk 'BEGIN{printf "%.1f\n",('$z')}' > PBC_center_z.tmp
touch PBC_center.tmp
echo "cellOrigin          x y z" > PBC_center.tmp
sed -i  "s/x/$(cat PBC_center_x.tmp)/" PBC_center.tmp
sed -i  "s/y/$(cat PBC_center_y.tmp)/" PBC_center.tmp
sed -i  "s/z/$(cat PBC_center_z.tmp)/" PBC_center.tmp
echo "the center of your system is："
cat PBC_center.tmp
sed -i "66c $(cat PBC_center.tmp)" nvt_equil.namd

rm *.tmp
cd ./../..


cd ./solvent/input_files/nvt-equilibration

cp nvt_equil.namd nvt_equil.namd.bak
cp ./../../min-max_center ./min-max_center.tmp

sed -i "s/{//g" ./min-max_center.tmp
sed -i "s/}//g" ./min-max_center.tmp

cat min-max_center.tmp | cut -d " " -f 1 | head -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 2 | head -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 3 | head -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 4 | head -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 5 | head -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 6 | head -n 1 >> PBC.tmp


x2=$(cat PBC.tmp | head -n 4 | tail -n 1)
#echo $x2
x1=$(cat PBC.tmp | head -n 1 | tail -n 1)
#echo $x1
awk 'BEGIN{print int("'$x2'" - "'$x1'" + 1)}' > PBC_x.tmp
#cat PBC_x.tmp
touch PBC_namd_x.tmp
echo "cellbasisvector1         PBC_x     0     0" > PBC_namd_x.tmp
sed -i  "s/PBC_x/$(cat PBC_x.tmp)/" PBC_namd_x.tmp
echo "the x-axis of your system is："
cat PBC_namd_x.tmp
sed -i "63c $(cat PBC_namd_x.tmp)" nvt_equil.namd 


y2=$(cat PBC.tmp | head -n 5 | tail -n 1)
#echo $y2
y1=$(cat PBC.tmp | head -n 2 | tail -n 1)
#echo $y1
awk 'BEGIN{print int("'$y2'" - "'$y1'" + 1)}' > PBC_y.tmp
#cat PBC_y.tmp
touch PBC_namd_y.tmp
echo "cellbasisvector2         0     PBC_y     0" > PBC_namd_y.tmp
sed -i  "s/PBC_y/$(cat PBC_y.tmp)/" PBC_namd_y.tmp
echo "the y-axis of your system is："
cat PBC_namd_y.tmp
sed -i "64c $(cat PBC_namd_y.tmp)" nvt_equil.namd 


z2=$(cat PBC.tmp | head -n 6 | tail -n 1)
#echo $z2
z1=$(cat PBC.tmp | head -n 3 | tail -n 1)
#echo $z1
awk 'BEGIN{print int("'$z2'" - "'$z1'" + 1)}' > PBC_z.tmp
#cat PBC_z.tmp
touch PBC_namd_z.tmp
echo "cellbasisvector3         0     0     PBC_z" > PBC_namd_z.tmp
sed -i  "s/PBC_z/$(cat PBC_z.tmp)/" PBC_namd_z.tmp
echo "the z-axis of your system is："
cat PBC_namd_z.tmp
sed -i "65c $(cat PBC_namd_z.tmp)" nvt_equil.namd 

cat min-max_center.tmp | cut -d " " -f 1 | tail -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 2 | tail -n 1 >> PBC.tmp
cat min-max_center.tmp | cut -d " " -f 3 | tail -n 1 >> PBC.tmp

x=$(cat PBC.tmp | head -n 7 | tail -n 1)
y=$(cat PBC.tmp | head -n 8 | tail -n 1)
z=$(cat PBC.tmp | head -n 9 | tail -n 1)

awk 'BEGIN{printf "%.1f\n",('$x')}' > PBC_center_x.tmp
awk 'BEGIN{printf "%.1f\n",('$y')}' > PBC_center_y.tmp
awk 'BEGIN{printf "%.1f\n",('$z')}' > PBC_center_z.tmp
touch PBC_center.tmp
echo "cellOrigin          x y z" > PBC_center.tmp
sed -i  "s/x/$(cat PBC_center_x.tmp)/" PBC_center.tmp
sed -i  "s/y/$(cat PBC_center_y.tmp)/" PBC_center.tmp
sed -i  "s/z/$(cat PBC_center_z.tmp)/" PBC_center.tmp
echo "the center of your system is："
cat PBC_center.tmp
sed -i "66c $(cat PBC_center.tmp)" nvt_equil.namd

rm *.tmp
cd ./../../..
