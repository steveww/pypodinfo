#!/bin/sh


set -e

SCRIPTS="image-repo image-policy-staging image-auto-staging kustomization-staging"
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
