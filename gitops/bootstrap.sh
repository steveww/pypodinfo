#!/bin/sh

if [ -z "$GITHUB_TOKEN" ]
then
    echo "GITHUB_TOKEN not set"
    echo "Bye"
    exit 1
fi

flux bootstrap github \
    --components-extra=image-reflector-controller,image-automation-controller \
    --owner=steveww \
    --repository=gitops \
    --path=clusters/webinar \
    --branch=main \
    --read-write-key \
    --personal
