#!/bin/sh

flux create source helm prometheus \
    --url=https://prometheus-community.github.io/helm-charts \
    --interval=1h \
    --export
