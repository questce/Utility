#!/bin/sh

#write grep string to key.txt
keyfile="./key.txt"

#grep targt folder
targetFolder="./targetFolder"

resultfile="./result.txt"

cat ${keyfile} | while read line
do
	grep -r -n ${line} ${targetFolder}
	if [ $? -eq 0 ]; then
		echo ${line}"=FOUND" >> $resultfile
	else
		echo ${line}"=NOT_FOUND" >> $resultfile
	fi
done