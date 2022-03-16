#!/bin/sh

SCRIPTPATH=$(dirname "$0")

cat <<!EOF!
---
apiVersion: v1
kind: Namespace
metadata:
  name: test

!EOF!

flux create helmrelease loadtest \
    --interval=10m \
    --source=HelmRepository/flagger \
    --chart=loadtester \
    --chart-version='>0.1.0' \
    --target-namespace=test \
    --export
