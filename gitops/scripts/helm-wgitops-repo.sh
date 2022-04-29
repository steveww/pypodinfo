#!/bin/sh

flux create source helm weave-gitops \
    --url=https://helm.gitops.weave.works \
    --interval=1h \
    --export
