#!/bin/sh

# This script should be run after 00-staging.sh

set -e

SCRIPTS="helm-prometheus-repo helm-prometheus kustomization-monitoring"
SCRIPTPATH=$(dirname "$0")

for SCRIPT in $SCRIPTS
do
    echo "$SCRIPT"
    CMD="${SCRIPT}.sh"
    YAML="${SCRIPT}.yaml"

    "$SCRIPTPATH/scripts/$CMD" > "$YAML"
done
