#!/bin/sh

SCRIPTPATH=$(dirname "$0")

cat <<!EOF!
---
apiVersion: v1
kind: Namespace
metadata:
  name: loki

!EOF!

flux create helmrelease loki \
    --interval=1h \
    --source=HelmRepository/grafana \
    --chart=loki \
    --chart-version='>2.0.0' \
    --crds=CreateReplace \
    --target-namespace=loki \
    --export

flux create helmrelease promtail \
  --interval=1h \
  --source=HelmRepository/grafana \
  --chart=promtail \
  --chart-version='>3.0.0' \
  --crds=CreateReplace \
  --target-namespace=loki \
  --values="${SCRIPTPATH}/promtail-values.yaml" \
  --export
