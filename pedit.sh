# Split each path on PATH onto its own line and allow user to edit.
# Then join and assign to PATH.
# This script must be *sourced* not executed, e.g., `alias pedit="~/sw/bin/pedit.sh"`
TMP=$(mktemp $USER-pedit.XXXXXXXXXX)
echo $PATH | sed 's/:/\n/g' > $TMP
$EDITOR $TMP
DATA=$(paste -sd : $TMP)
if [[ -z ${DATA// /} ]] || [[ "$PATH" == "$DATA" ]] ; then
    echo "PATH not changed"
else
    export PATH=$DATA
    echo "PATH updated"
fi
rm -f "$TMP"
