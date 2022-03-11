#!/bin/sh

flux create image policy pypodinfo-prod \
    --image-ref=pypodinfo \
    --select-semver=">=1.0.0" \
    --export
