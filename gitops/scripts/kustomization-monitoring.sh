#!/bin/sh

flux create kustomization monitoring \
    --target-namespace=prometheus \
    --source=pypodinfo \
    --path=kustomize/monitoring \
    --prune=true \
    --interval=30s \
    --export
