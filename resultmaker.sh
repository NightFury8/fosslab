#!/bin/bash
#download s1 and s2 results to home directory 
#results1 file in home contains s1 result
#results2 file in home contains s2 result
pdftotext ~/Result_MDL.pdf m1 
tr -d "\n\r" < m1 > m2 
sed 's/MDL16CS/\n&/g' m2 > m3 
sed 's/ELECTRONICS/\n&/g' m3 > m4 
grep 'MDL16CS' m4 > m5 
sed 's/MA101/  &/g' m5 > m6 
sed 's/MA101//g' m6 >m7
sed 's/PH100//g' m7 >m6
sed 's/BE110//g' m6 >m7
sed 's/BE10105//g' m7 >m6
sed 's/BE103//g' m6 >m7
sed 's/EE100//g' m7 >m6
sed 's/PH110//g' m6 >m7
sed 's/EE110//g' m7 >m6
sed 's/CS110(/(/g' m6 >m7
tr -d " \r" < m7 > m8
tr -d ",\r" < m8 > m9
sed 's/(/ &/g' m9 > m10
sed 's/(O)/10/g' m10 > m11
sed 's/(A+)/9/g' m11 > m10
sed 's/(A)/8/g' m10 > m11
sed 's/(B+)/7/g' m11 > m10
sed 's/(B)/6/g' m10 > m11
sed 's/(C)/5/g' m11 > m10
sed 's/(P)/4/g' m10 > m11
sed 's/(F)/0/g' m11 > m10
sed 's/(F)/0/g' m10 > m11
tr -cd '\11\12\15\40-\176' < m11 > m12
while read -r line
do
    name="$line"
	arr=($name)
	maths=${arr[1]} 
	physics=${arr[2]} 
	graphics=${arr[3]} 
	computer=${arr[4]} 
	sustainable=${arr[5]} 
	electrical=${arr[6]} 
	physics_lab=${arr[7]} 
	electrical_lab=${arr[8]} 
	computer_lab=${arr[9]} 
	name10=$(($maths*4 + $physics*4 + $graphics*4 + $computer*3 + $sustainable*3 + $electrical*3 + $physics_lab*1 + $electrical_lab*1 + $computer_lab*1))
	mark=${name10}
	var1=$(bc <<< "scale=4; ($name10)/23")
	echo ${arr[0]}   ${var1}  ${mark}>> results1.txt
done < "m12"
clear
pdftotext ~/result_MDL2.pdf m1 
tr -d "\n\r" < m1 > m2 
sed 's/MDL16CS/\n&/g' m2 > m3 
sed 's/ELECTRONICS/\n&/g' m3 > m4 
sed 's/TCE16CS/\n&/g' m4 > m5 
grep 'MDL16CS' m5 > m6 
sed 's/CY100/  &/g' m6 > m7 
sed 's/CY100(/(/g' m7 >m8
sed 's/BE100(/(/g' m8 >m7
sed 's/EC100(/(/g' m7 >m8
sed 's/CY110(/(/g' m8 >m7
sed 's/EC110(/(/g' m7 >m8
sed 's/MA102(/(/g' m8 >m7
sed 's/BE102(/(/g' m7 >m8
sed 's/CS100(/(/g' m8 >m7
sed 's/CS120(/(/g' m7 >m8
tr -d " \r" < m8 > m9
tr -d ",\r" < m9 > m10
sed 's/(/ &/g' m10 > m11
sed 's/(O)/10/g' m11 > m12
sed 's/(A+)/9/g' m12 > m11
sed 's/(A)/8/g' m11 > m12
sed 's/(B+)/7/g' m12 > m11
sed 's/(B)/6/g' m11 > m12
sed 's/(C)/5/g' m12 > m11
sed 's/(P)/4/g' m11 > m12
sed 's/(F)/0/g' m12 > m11
sed 's/(F)/0/g' m11 > m12
tr -cd '\11\12\15\40-\176' < m12 > m13
while read -r line
do
    name="$line"
	arr=($name)
	differential=${arr[1]} 
	chemistry=${arr[2]} 
	mechanics=${arr[3]} 
	design=${arr[4]} 
	chemistry_lab=${arr[5]} 
	electronics2=${arr[6]} 
	electronics_lab=${arr[7]} 
	computer_lab2=${arr[8]} 
	computer2=${arr[9]} 
	name20=$(($differential*4 + $chemistry*4 + $mechanics*3 + $design*3 + $chemistry_lab*3 + $electronics2*1 + $electronics_lab*1 + $computer_lab2*1 + $computer2*4 ))
	mark=${name20}
	var1=$(bc <<< "scale=4; ($name20)/24")
	echo ${var1} ${mark}>> results2.txt
done < "m13"
rm m*
echo "run cgpacalculator to get cgpa"
