# Split each path on PATH onto its own line and allow user to edit.
# Then join and assign to PATH.
# This script must be *sourced* not executed, e.g., `alias pedit="~/sw/bin/pedit.sh"`
# Optionally specify a different env, e.g.,
#   pedit PYTHONPATH
if [[ -n "$1" ]] ; then
    VAR=$1
else
    VAR=PATH
fi
TMP=$(mktemp $USER-pedit.XXXXXXXXXX)
echo ${!VAR} | sed 's/:/\n/g' > $TMP
$EDITOR $TMP
DATA=$(paste -sd : $TMP)
if [[ -z ${DATA// /} ]] || [[ "${!VAR}" == "$DATA" ]] ; then
    echo "${!VAR} not changed"
else
    declare "$VAR=$DATA"
    echo "${!VAR} updated"
fi
rm -f "$TMP"
