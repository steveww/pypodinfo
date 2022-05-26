#!/bin/sh

flux create image policy pypodinfo-staging \
    --image-ref=pypodinfo \
    --select-numeric=asc \
    --filter-regex='Build-(?P<b>[0-9]+)' \
    --filter-extract='$b' \
    --export
