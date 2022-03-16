#!/bin/sh

#set -x

SCRIPTPATH=$(dirname "$0")

cat <<!EOF!
---
apiVersion: v1
kind: Namespace
metadata:
  name: ingress-nginx

!EOF!

flux create helmrelease ingress-nginx \
    --interval=10m \
    --source=HelmRepository/ingress-nginx \
    --chart=ingress-nginx \
    --chart-version='>4.0.0' \
    --target-namespace=ingress-nginx \
    --values="${SCRIPTPATH}/nginx-values.yaml" \
    --export
