#!/bin/env bash

if [ "$#" -eq 1 ]; then
	CELLNAME=$1
#	OPTION=$2
else

echo "
Usage: ./runCell.sh <CellName> <autoflow[All]>
"


fi


NETLISTDIR="/home/fsabado/Tezzaron3D_project/SpiceNetlist/netlistScript"


CELLDIR=$1

if [ ! -e $CELLDIR ]; then
	echo "$CELLDIR doesn't exist. Set up directory."
	exit 1
	
fi




if [ $(find $CELLDIR -name "*cif" | wc -l )  -eq 0 ]; then
	echo "$Checking Astran"
	
	if [ $(find $CELLDIR -name "*ASTRAN.sp" | wc -l )  -eq 0 ]; then
		echo "$CELLDIR ASTRAN netlist does not exist."
		
		if [ $(find $NETLISTDIR -name "${CELLDIR}_ASTRAN.sp" | wc -l ) -eq 1  ]; then
			ASTRAN_NETLIST=$(find $NETLISTDIR -name "${CELLDIR}_ASTRAN.sp")
			echo "Copying ASTRAN netlist"
			echo "Netlist exist"
			cp $ASTRAN_NETLIST ${CELLDIR}/
		fi
				
		exit 1
	fi
	
	
	#echo "Running Astran for $CELLNAME"
	#(cd $CELLDIR; 
	at now + 5 min -m -f ./runBatch.sh;)
	
else
	echo "$CELLNAME CIF already exist"
fi


