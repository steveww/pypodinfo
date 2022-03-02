#!/bin/sh

flux create source git pypodinfo \
    --url=ssh://git@github.com/steveww/pypodinfo \
    --branch=main \
    --interval=30s \
    --secret-ref=ssh-credentials \
    --export
