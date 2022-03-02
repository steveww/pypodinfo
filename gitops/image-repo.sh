#!/bin/sh

flux create image repository pypodinfo \
    --image=docker.io/steveww/pypodinfo \
    --interval=1m \
    --export
