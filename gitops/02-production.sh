#!/bin/sh


set -e

SCRIPTS="helm-nginx-repo helm-nginx helm-flagger-repo helm-flagger helm-loadtest image-policy-prod image-auto-prod kustomization-prod"
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
