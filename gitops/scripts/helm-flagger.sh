#!/bin/sh

SCRIPTPATH=$(dirname "$0")

flux create helmrelease flagger \
    --interval=10m \
    --source=HelmRepository/flagger \
    --chart=flagger \
    --chart-version='>1.0.0' \
    --target-namespace=ingress-nginx \
    --values="${SCRIPTPATH}/flagger-values.yaml" \
    --export
