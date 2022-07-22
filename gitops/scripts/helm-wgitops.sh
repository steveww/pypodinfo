#!/bin/sh

SCRIPTPATH=$(dirname "$0")

flux create helmrelease weave-gitops \
    --interval=1h \
    --source=HelmRepository/weave-gitops \
    --chart=weave-gitops \
    --chart-version='>2.2.0' \
    --crds=CreateReplace \
    --target-namespace=flux-system \
    --values="${SCRIPTPATH}/wgitops-values.yaml" \
    --export