#!/usr/bin/env bash

NAME="$1"
PROJECT_NAME="$2"
REPO="git@github.com:jpweeks/${NAME}-boilerplate.git"

echo "Cloning $REPO ..."
git clone $REPO $PROJECT_NAME
cd $PROJECT_NAME

echo "Setting up ..."
find ./ -type f -exec sed -i '' -e "s/__project-name__/$PROJECT_NAME/g" {} \;

echo "Initializing git ..."
rm -rf .git
git init
git add .
git commit -m "Init"
git checkout -b develop
