#!/bin/sh

if ! `git status | grep -q 'nothing to commit, working directory clean'` ; then
	echo 'Save your work first!'
	exit -1
fi

echo 'Checking out master branch' &&
git checkout master &&

echo 'Copying build files' &&
cp -r build/* . &&

if ! `git status | grep -q 'nothing to commit, working directory clean'` ; then
	echo 'Committing changes' &&
	git status &&
	git add . &&
	git commit -m'Update public site.' &&

	echo 'Deploying site' &&
	git push
else
	echo 'Nothing to deploy!'
fi

git checkout src
