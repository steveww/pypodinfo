#!/bin/sh

flux create source git pypodinfo \
    --url=https://github.com/steveww/pypodinfo \
    --branch=main \
    --interval=30s \
    --export
