#!/bin/sh

flux create kustomization grafana \
    --target-namespace=grafana \
    --source=pypodinfo \
    --path=kustomize/grafana \
    --prune=true \
    --interval=30s \
    --export
