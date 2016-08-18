#!/bin/env bash

if [ "$#" -eq 1 ]; then
	CELLNAME=$1
#	OPTION=$2
else

echo "
Usage: ./cellReport.sh <CellName>
"


fi


NETLISTDIR="/home/fsabado/Tezzaron3D_project/SpiceNetlist/netlistScript"

CELLDIR=$1

echo "----------------$CELLDIR-------------------"


if [ ! -e $CELLDIR ]; then
	echo "$CELLDIR doesn't exist. Set up directory."
	exit 1
fi

NUMBERCIF=$(find $CELLDIR -name "*cif" | wc -l )
ASTRAN_EXIST=$(find $NETLISTDIR -name "${CELLDIR}_ASTRAN.sp" | wc -l )

if [ $ASTRAN_EXIST -eq 1 ]; then
	echo "ASTRAN FILE: Exist - ${CELLDIR}_ASTRAN.sp"
fi

echo "Number of CIF/GDS Files: $NUMBERCIF"

if [ ! -e "$CELLDIR/autoflow.log" ]; then
	echo "CHECK $CELLDIR: autoflow.log does not exist"
else 

	echo "Autoflow Log:"
	cat $CELLDIR/autoflow.log

fi


#echo "Outputs Log:"
#cat $CELLDIR/outputs.log


