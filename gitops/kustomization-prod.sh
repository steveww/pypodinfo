#!/bin/sh

flux create kustomization pypodinfo-prod \
    --target-namespace=pypodinfo \
    --source=pypodinfo \
    --path=kustomize/prod \
    --prune=true \
    --interval=30s \
    --export
