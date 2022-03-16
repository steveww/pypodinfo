#!/bin/sh

flux create image update pypodinfo-staging \
    --git-repo-ref=pypodinfo \
    --git-repo-path=kustomize/staging \
    --checkout-branch=main \
    --author-name=fluxbot \
    --author-email=fluxbot@users.noreply.github.com \
    --commit-template='{{range .Updated.Images}}{{println .}}{{end}}' \
    --export
