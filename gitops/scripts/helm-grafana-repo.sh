#!/bin/sh

flux create source helm grafana \
    --url=https://grafana.github.io/helm-charts \
    --interval=1h \
    --export
