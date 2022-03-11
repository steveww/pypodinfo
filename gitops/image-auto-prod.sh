#!/bin/sh

flux create image update pypodinfo-prod \
    --git-repo-ref=pypodinfo \
    --git-repo-path=kustomize/prod \
    --checkout-branch=main \
    --push-branch=flux-image-update \
    --author-name=fluxbot \
    --author-email=fluxbot@users.noreply.github.com \
    --commit-template='{{range .Updated.Images}}{{println .}}{{end}}' \
    --export
