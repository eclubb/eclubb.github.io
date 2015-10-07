#!/bin/sh

if ! `git status | grep -q 'nothing to commit, working directory clean'` ; then
	echo -e "\\n Save your work first!\n"
	exit -1
fi

echo -e "\\n -> Checking out master branch\n" &&
git checkout master &&

echo -e "\\n -> Copying build files\n" &&
cp -r build/* . &&

if ! `git status | grep -q 'nothing to commit, working directory clean'` ; then
	echo -e "\\n -> Committing changes\n" &&
	git status &&
	git add . &&
	git commit -m'Update public site.' &&

	echo -e "\\n -> Deploying site\n" &&
	git push
else
	echo -e "\\n -> Nothing to deploy!\n"
fi

git checkout src
