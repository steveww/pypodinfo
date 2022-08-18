#!/bin/sh

SCRIPTPATH=$(dirname "$0")

flux create helmrelease policy-agent \
    --interval=1h \
    --source=HelmRepository/policy-agent \
    --chart=policy-agent \
    --chart-version='0.1.0' \
    --crds=CreateReplace \
    --target-namespace=policy-system \
    --values="${SCRIPTPATH}/policy-values.yaml" \
    --export