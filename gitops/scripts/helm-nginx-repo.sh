#!/bin/sh

flux create source helm ingress-nginx \
    --url=https://kubernetes.github.io/ingress-nginx \
    --interval=10m \
    --export
