#!/bin/bash
#
#Autor: Alex Vieites Romero

clear

while [[ true ]]
do
	echo "Nombre d'usuaris entre 1 i 100"
	read usuari2
	if ((usuari2 >=1 && <= 100))
	then
		while [[ true ]]
		do
			echo "Valor de id d'usuaris, 5000 com a mínim"
			read uidNumber
			if ((uidNumber >= 5000))
			then
				for (( cont=0; cont<usuari2; cont++ )) 
				 do
					PASSWORD=$(echo $RANDOM$(date +%N%s) |md5sum | cut -c 2-9)
					echo "usr$uidNumber:$PASSWORD" | chpasswd
					echo "usr$uidNumber:$PASSWORD" >> ctsUsuaris.txt
					((uidNumber++))
				done
			else
				echo "El nombre de usuari introduït no és vàlid"
				echo "Critical Error: Code exited 1"
				exit 1
			break;
			fi
		done
	break;
	fi
done
exit 0

