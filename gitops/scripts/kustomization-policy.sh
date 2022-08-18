#!/bin/sh

flux create kustomization policy \
    --source=pypodinfo \
    --path=policy \
    --prune=true \
    --interval=30s \
    --export
