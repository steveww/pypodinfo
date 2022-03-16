#!/bin/sh

flux create source helm flagger \
    --url=https://flagger.app \
    --interval=10m \
    --export
