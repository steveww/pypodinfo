#!/bin/sh

if [ -z "$GITHUB_TOKEN" ]
then
    echo "GITHUB_TOKEN not set"
    echo "Bye"
    exit 1
fi

kubectl create secret generic github-token \
    -n flux-system \
    --from-literal="token=$GITHUB_TOKEN"
