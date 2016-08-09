#!/bin/bash -e

#Get Current Directory Snippet
#http://stackoverflow.com/questions/59895/can-a-bash-script-tell-which-directory-it-is-stored-in
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

CELLNAME="TH24_A"
PROJECTDIR="$(echo $DIR)"
LOGFILE="${PROJECTDIR}/history.log"
RULESFILE="${PROJECTDIR}/Chartered130.rul"
NETLISTFILE="${PROJECTDIR}/$(echo $CELLNAME | tr A-Z a-z )_ASTRAN.sp"

# Change the template
sed "
s#<LOGFILE>#$(echo $LOGFILE)#g
s#<RULESFILE>#$(echo $RULESFILE)#g
s#<PROJECTDIR>#$(echo $PROJECTDIR)#g
s#<CELLNAME>#$(echo $CELLNAME)#g
s#<NETLISTFILE>#$(echo $NETLISTFILE)#g
" "$@"
