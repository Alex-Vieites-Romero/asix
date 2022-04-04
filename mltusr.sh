#!/bin/bash
#Autor: Alex Vieites Romero


clear
if [[$id -u = 0]]
then
	echo "L'script ha de ser executat com a sudo o root"
	echo "Critical Error: code exited 1"
	exit 1
else 
	wget http://www.collados.org/asix2/m06/uf2/usuaris.ods
	clear
	if [[ -e usuaris.csv ]] 
	then
		echo "El fitxer existeix"
		echo "Critical Error: code exited 2"
		exit 2
	else
		libreoffice --headless --convert-to csv usuaris.ods
		cut -d "," usuaris.csv
		while read line
			do
				useradd $line -u $uid -g users
				let uid=uid+1
			done < usuaris.csv
			if (( $? != 0 ))
				then
				echo "No s'ha pogut crear usuaris"
				echo "Critical Error: code exited 3"
				exit 3
				else
				exit 0
				fi
		
	fi
fi
