#!/bin/sh

flux create kustomization pypodinfo-staging \
    --target-namespace=pypodinfo \
    --source=pypodinfo \
    --path=kustomize/staging \
    --prune=true \
    --interval=30s \
    --export
