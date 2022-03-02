#!/bin/sh

flux create image policy pypodinfo \
    --image-ref=pypodinfo \
    --select-semver=">=1.0.0" \
    --export
