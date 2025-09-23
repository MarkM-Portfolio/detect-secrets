#!/bin/bash

echo -e '\nCreate Baseline Files'
PINK_BUILDS=`ls ${PWD}/pink`
BLUE_BUILDS=`ls ${PWD}/blue`

echo -e '\nCreating Baseline to Pink Builds...'
for repo in ${PINK_BUILDS[@]}; do
	REPO_BUILD=pink
	REPO_NAME=$repo
	echo -e "...$repo"
	cd ./$REPO_BUILD/$REPO_NAME && echo "test.password=123t3stP2ss" > secrets.file
	git add . && git commit -m 'test commit with new secret'
	rm secrets.file
	cd -
done

echo -e '\nInstalling to Blue Builds...'
for repo in ${BLUE_BUILDS[@]}; do
	REPO_BUILD=blue
	REPO_NAME=$repo
	echo -e "...$repo"
	cd ./$REPO_BUILD/$REPO_NAME && echo "test.password=123t3stP2ss" > secrets.file
	git add . && git commit -m 'test commit with new secret'
	rm secrets.file
	cd -
done

echo -e '\nDONE ..!'
