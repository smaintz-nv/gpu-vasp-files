#!/bin/bash
if [ "$#" -eq 0 ]; then
	echo "Syntax is: $0 path_to_POTCAR_database, e.g.:"
	echo "$0 ~/potcars/PAW_PBE/"
	exit 1
else
	rm -f POTCAR
	for i in B; do
		filenameZ="$1/PAW_PBE/$i/POTCAR.Z"
		filename="$1/PAW_PBE/$i/POTCAR"
		if [ -f $filename ]; then
			cat $filename >> POTCAR
		elif [ -f $filenameZ ]; then
			zcat $filename >> POTCAR
		else
			echo "file $filename or $filenameZ not found, please check you POTCAR database path"
			exit 1
		fi
	done
	echo "e72a4c3c460ef528739afc50d581a6dd POTCAR"| md5sum -c --quiet
	if [ $? -ne 0 ]; then
		echo "The POTCAR was not generated as expected, please use the path to potentials as shown in the instructions."
		exit 1
	else
		echo "POTCAR for B.hR105 has been generated successfully"
		exit 0
	fi
fi
