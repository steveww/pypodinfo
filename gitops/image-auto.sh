#!/bin/sh

flux create image update pypodinfo \
    --git-repo-ref=pypodinfo \
    --git-repo-path=kustomize \
    --checkout-branch=main \
    --push-branch=flux-image-update \
    --author-name=fluxbot \
    --author-email=fluxbot@users.noreply.github.com \
    --commit-template='{{range .Updated.Images}}{{println .}}{{end}}' \
    --export
