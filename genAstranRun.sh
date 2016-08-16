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

CELLNAME="$(echo $1 | tr a-z A-Z)"
PROJECTDIR="$(echo $DIR)/${1}"
LOGFILE="./history.log"
RULESFILE="./Chartered130.rul"
NETLISTFILE="./$(echo $CELLNAME | tr a-z A-Z)_ASTRAN.sp"


#Copies requirements
cp "$DIR/Chartered130.rul" "${PROJECTDIR}/"
cp "$DIR/gurobi.env" "${PROJECTDIR}/"
cp "$DIR/runBatch.sh" "${PROJECTDIR}/"
mkdir -p "${PROJECTDIR}/Layouts"


# Change the Full template
sed "
s#<LOGFILE>#$(echo $LOGFILE)#g
s#<RULESFILE>#$(echo $RULESFILE)#g
s#<PROJECTDIR>#$(echo $PROJECTDIR)#g
s#<CELLNAME>#$(echo $CELLNAME)#g
s#<NETLISTFILE>#$(echo $NETLISTFILE)#g
" "${DIR}/astranRun.run" > "$PROJECTDIR/astranRun.run"

# Change the Full template (Batch - contains exit)
sed "
s#<LOGFILE>#$(echo $LOGFILE)#g
s#<RULESFILE>#$(echo $RULESFILE)#g
s#<PROJECTDIR>#$(echo $PROJECTDIR)#g
s#<CELLNAME>#$(echo $CELLNAME)#g
s#<NETLISTFILE>#$(echo $NETLISTFILE)#g
" "${DIR}/astranRunBatch.run" > "$PROJECTDIR/astranRunBatch.run"

# Change the Save template
sed "
s#<LOGFILE>#$(echo $LOGFILE)#g
s#<RULESFILE>#$(echo $RULESFILE)#g
s#<PROJECTDIR>#$(echo $PROJECTDIR)#g
s#<CELLNAME>#$(echo $CELLNAME)#g
s#<NETLISTFILE>#$(echo $NETLISTFILE)#g
" "${DIR}/astranSave.run" > "$PROJECTDIR/astranSave.run"

# Change the Autoflow template
sed "
s#<LOGFILE>#$(echo $LOGFILE)#g
s#<RULESFILE>#$(echo $RULESFILE)#g
s#<PROJECTDIR>#$(echo $PROJECTDIR)#g
s#<CELLNAME>#$(echo $CELLNAME)#g
s#<NETLISTFILE>#$(echo $NETLISTFILE)#g
" "${DIR}/astranAutoflow.run" > "$PROJECTDIR/astranAutoflow.run"

# Change the Autoflow template
sed "
s#<LOGFILE>#$(echo $LOGFILE)#g
s#<RULESFILE>#$(echo $RULESFILE)#g
s#<PROJECTDIR>#$(echo $PROJECTDIR)#g
s#<CELLNAME>#$(echo $CELLNAME)#g
s#<NETLISTFILE>#$(echo $NETLISTFILE)#g
" "${DIR}/astranAutoflow.run" > "$PROJECTDIR/astranAutoflowAll.run"

# Change the Cellgen template
sed "
s#<LOGFILE>#$(echo $LOGFILE)#g
s#<RULESFILE>#$(echo $RULESFILE)#g
s#<PROJECTDIR>#$(echo $PROJECTDIR)#g
s#<CELLNAME>#$(echo $CELLNAME)#g
s#<NETLISTFILE>#$(echo $NETLISTFILE)#g
" "${DIR}/astranCellgen.run" > "$PROJECTDIR/astranCellgen.run"

# Change the Load template
sed "
s#<LOGFILE>#$(echo $LOGFILE)#g
s#<RULESFILE>#$(echo $RULESFILE)#g
s#<PROJECTDIR>#$(echo $PROJECTDIR)#g
s#<CELLNAME>#$(echo $CELLNAME)#g
s#<NETLISTFILE>#$(echo $NETLISTFILE)#g
" "${DIR}/astranLoad.run" > "$PROJECTDIR/astranLoad.run"
