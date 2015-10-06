#!/bin/sh

if ! `git status | grep -q 'nothing to commit, working directory clean'` ; then
	echo 'Save your work first!'
	exit -1
fi

echo 'Checking out master branch' &&
git checkout master &&
echo 'Copying build files' &&
cp -r build/* . &&
echo 'Committing changes' &&
git add . &&
git status &&
git commit -m'Update public site.' &&
echo 'Deploying site' &&
git push &&
git checkout src
