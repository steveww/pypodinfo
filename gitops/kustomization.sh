#!/bin/sh

flux create kustomization pypodinfo \
    --target-namespace=pypodinfo \
    --source=pypodinfo \
    --path=kustomize \
    --prune=true \
    --interval=30s \
    --export
