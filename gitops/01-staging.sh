#!/bin/sh

# This script should be run after Flux bootstrap and SSH credentails

set -e

SCRIPTS="image-policy-staging image-auto-staging kustomization-staging"
SCRIPTPATH=$(dirname "$0")

SCRIPT="git-repo"
CMD="${SCRIPT}.sh"
YAML="${SCRIPT}.yaml"

if [ ! -f "$YAML" ]
then
    echo "$SCRIPT"
    "$SCRIPTPATH/scripts/$CMD" > "$YAML"
fi

for SCRIPT in $SCRIPTS
do
    echo "$SCRIPT"
    CMD="${SCRIPT}.sh"
    YAML="${SCRIPT}.yaml"

    "$SCRIPTPATH/scripts/$CMD" > "$YAML"
done
