#!/bin/sh

# This script should be run after Flux bootstrap and SSH credentails

set -e

SCRIPTS="git-repo image-repo image-policy-staging image-auto-staging kustomization-staging"
SCRIPTPATH=$(dirname "$0")

for SCRIPT in $SCRIPTS
do
    echo "$SCRIPT"
    CMD="${SCRIPT}.sh"
    YAML="${SCRIPT}.yaml"

    "$SCRIPTPATH/scripts/$CMD" > "$YAML"
done