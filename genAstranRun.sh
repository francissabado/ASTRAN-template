#!/bin/bash

#-e Not compatible with large print out


if [ "$#" -ne 1 ];
then
    echo "Usage: ./genAstranRun.sh <CELLNAME>"
    exit 0
fi

mkdir -p ./"${1}"

#Get Current Directory Snippet
#http://stackoverflow.com/questions/59895/can-a-bash-script-tell-which-directory-it-is-stored-in
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

CELLNAME="$(echo $1)"
PROJECTDIR="$(echo $DIR)/${1}"
LOGFILE="${PROJECTDIR}/history.log"
RULESFILE="${PROJECTDIR}/Chartered130.rul"
NETLISTFILE="${PROJECTDIR}/$(echo $CELLNAME | tr A-Z a-z )_ASTRAN.sp"


#Copies requirements
cp "$DIR/Chartered130.rul" "${PROJECTDIR}/"
mkdir -p "${PROJECTDIR}/Layouts"


# Change the template
sed "
s#<LOGFILE>#$(echo $LOGFILE)#g
s#<RULESFILE>#$(echo $RULESFILE)#g
s#<PROJECTDIR>#$(echo $PROJECTDIR)#g
s#<CELLNAME>#$(echo $CELLNAME)#g
s#<NETLISTFILE>#$(echo $NETLISTFILE)#g
" "${DIR}/astranRun.run" > "$PROJECTDIR/astranRun_${CELLNAME}.run"


# mkdir -p "${DIR}/Netlist"
