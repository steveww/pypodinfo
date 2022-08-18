#!/bin/sh

flux create source helm policy-agent \
    --url=http://fastolfe.co.uk/charts \
    --interval=1h \
    --export
