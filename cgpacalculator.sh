#!/bin/bash
#download resultorder c4b.txt
#result.txt is final result

paste results1.txt results2.txt > result12
while read -r line
do
    name="$line"
	arr=($name)
	roll=${arr[0]}
	s1=${arr[2]} 
	s2=${arr[4]} 
	s12=$(($s1*1 + $s2*1 ))
	cgpa=$(bc <<< "scale=4; ($s12)/47")
	echo ${arr[0]} ${arr[1]} ${arr[3]} ${cgpa} >> t1
done < "result12"	
while read -r line
do
    name="$line"
	arr=($name)
	roll=${arr[0]}
	s1=${arr[2]} 
	s2=${arr[4]} 
	echo  ${arr[5]} ${arr[6]} ${arr[7]}>>  order
done < "c4b.txt"	
grep MDL16CS order > order2
join <(sort order2)<(sort tl) > result.txt 
