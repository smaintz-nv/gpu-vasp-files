#!/bin/bash
if [ "$#" -eq 0 ]; then
	echo "Syntax is: $0 path_to_POTCAR_database, e.g.:"
	echo "$0 ~/potcars/USPP_GGA/"
	exit 1
else
	rm -f POTCAR
	for i in Si O H_200eV; do
		filenameZ="$1/USPP_GGA/$i/POTCAR.Z"
		filename="$1/USPP_GGA/$i/POTCAR"
		if [ -f $filename ]; then
			cat $filename >> POTCAR
		elif [ -f $filenameZ ]; then
			zcat $filename >> POTCAR
		else
			echo "file $filename or $filenameZ not found, please check you POTCAR database path"
			exit 1
		fi
	done
	echo "81b893774e8bf9e78365093c5595c724 POTCAR"| md5sum -c --quiet
	if [ $? -ne 0 ]; then
		echo "The POTCAR was not generated as expected, please use the path to potentials as shown in the instructions."
		exit 1
	else
		echo "POTCAR for silicaIFPEN has been generated successfully"
		exit 0
	fi
fi
