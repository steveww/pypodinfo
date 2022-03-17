#!/bin/sh

# This script should be run after 00-staging.sh

set -e

SCRIPTS="helm-nginx-repo helm-nginx helm-flagger-repo helm-flagger helm-loadtest image-policy-prod image-auto-prod kustomization-prod"
SCRIPTPATH=$(dirname "$0")

for SCRIPT in $SCRIPTS
do
    echo "$SCRIPT"
    CMD="${SCRIPT}.sh"
    YAML="${SCRIPT}.yaml"

    "$SCRIPTPATH/scripts/$CMD" > "$YAML"
done
