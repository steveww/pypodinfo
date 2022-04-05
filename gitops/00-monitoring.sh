#!/bin/sh

# This script should be run after 00-staging.sh

set -e

SCRIPTS="helm-prometheus-repo helm-prometheus helm-grafana-repo helm-loki kustomization-monitoring"
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
