#!/bin/sh

SCRIPTPATH=$(dirname "$0")

cat <<!EOF!
---
apiVersion: v1
kind: Namespace
metadata:
  name: prometheus

!EOF!

flux create helmrelease prometheus \
    --interval=1h \
    --source=HelmRepository/prometheus \
    --chart=kube-prometheus-stack \
    --chart-version='>34.0.0' \
    --target-namespace=prometheus \
    --values="${SCRIPTPATH}/prometheus-values.yaml" \
    --export
