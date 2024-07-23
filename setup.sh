#!/usr/bin/env bash

# Usage
# git-templategen -n kewl_project -b master user/neat_template

REPO_PATH="${@: -1}"

while getopts b:n: flag
do
	case "${flag}" in
		b) BRANCH=${OPTARG};;
		n) NAME=${OPTARG};;
	esac
done

if [[ -z "$REPO_PATH" ]]; then
	echo "Please specify a repo path"
	exit 0
fi

if [[ -z "$NAME" ]]; then
	echo "Please specify a project name [-n]"
	exit 0
fi

REPO="git@github.com:${REPO_PATH}.git"

if [[ -z "$BRANCH" ]]; then
	BRANCH="master"
fi

echo "Cloning $REPO ..."
git clone $REPO $NAME
cd $NAME
git checkout $BRANCH

echo "Setting up $NAME ..."
find ./ -type f -exec sed -i '' -e "s/__project-name__/$NAME/g" {} \;

echo "Initializing git ..."
rm -rf .git
git init
git add .
git commit -m "Init"
git checkout -b develop
