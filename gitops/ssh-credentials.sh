#!/bin/sh

NAME=ssh-credentials
FILE=${NAME}.yaml

clear
echo "Creating K8s secret $NAME in file $FILE"
read -p "Continue <y/n>? " ANS
if [ "$ANS" != "y" ]
then
    echo "Bye"
    exit 0
fi

if ! which -s yq
then
    echo "yq not installed or not on the PATH"
    echo "Bye"
    exit 1
fi

flux create secret git $NAME \
    --url='ssh://git@github.com/steveww/pypodinfo' \
    --export > $FILE

echo ""
echo "Public key. Copy this to GitHub."
echo ""
yq eval '.stringData."identity.pub"' $FILE > key.pub
cat key.pub
