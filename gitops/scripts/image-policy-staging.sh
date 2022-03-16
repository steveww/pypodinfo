#!/bin/sh

flux create image policy pypodinfo-staging \
    --image-ref=pypodinfo \
    --select-alpha=asc \
    --filter-regex='Build-[0-9]+' \
    --export
