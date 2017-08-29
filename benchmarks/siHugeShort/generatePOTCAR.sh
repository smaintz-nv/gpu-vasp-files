#!/bin/bash
if [ "$#" -eq 0 ]; then
	echo "Syntax is: $0 path_to_POTCAR_database, e.g.:"
	echo "$0 ~/potcars/PAW_GGA/"
	exit 1
else
	rm -f POTCAR
	filenameZ="$1/PAW_GGA/Si/POTCAR.Z"
	filename="$1/PAW_GGA/Si/POTCAR"
	if [ -f $filename ]; then
		cat $filename >> POTCAR
	elif [ -f $filenameZ ]; then
		zcat $filename >> POTCAR
	else
		echo "file $filename or $filenameZ not found, please check you POTCAR database path"
		exit 1
	fi
	echo "fa1ca8b47f680b37e46b843a4651a032  POTCAR"| md5sum -c --quiet
	if [ $? -ne 0 ]; then
		echo "The POTCAR was not generated as expected, please use the path to potentials as shown in the instructions."
		exit 1
	else
		echo "POTCAR for siHugeShort has been generated successfully"
		exit 0
	fi
fi
