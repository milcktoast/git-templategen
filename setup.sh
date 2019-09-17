#!/usr/bin/env bash

NAME="$1"
PROJECT_NAME="$2"
REPO="git@github.com:jpweeks/${NAME}-boilerplate.git $PROJECT_NAME"

git clone $REPO
cd $PROJECT_NAME

rm -rf .git
git init
git add .
git commit -m "Init"
git checkout -b develop
