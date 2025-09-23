#!/bin/bash

echo -e '\nInstalling Pre-Commit Hooks'
PINK_BUILDS=`ls ${PWD}/pink`
BLUE_BUILDS=`ls ${PWD}/blue`
OTHER_BUILDS=`ls ${PWD}/other`

echo -e '\nInstalling to Pink Builds...'
for repo in ${PINK_BUILDS[@]}; do
	REPO_BUILD=pink
	REPO_NAME=$repo
	echo -e "...$repo"
	mkdir -p ./$REPO_BUILD/$REPO_NAME/.git/hooks/pre-commit.d
	cp ./git-hooks/git-multi-hook.sh ./$REPO_BUILD/$REPO_NAME/.git/hooks/pre-commit
	cp ./git-hooks/hooks/pre-commit.d/detect-secrets.sh ./$REPO_BUILD/$REPO_NAME/.git/hooks/pre-commit.d
done

echo -e '\nInstalling to Blue Builds...'
for repo in ${BLUE_BUILDS[@]}; do
	REPO_BUILD=blue
	REPO_NAME=$repo
	echo -e "...$repo"
	mkdir -p ./$REPO_BUILD/$REPO_NAME/.git/hooks/pre-commit.d
	cp ./git-hooks/git-multi-hook.sh ./$REPO_BUILD/$REPO_NAME/.git/hooks/pre-commit
	cp ./git-hooks/hooks/pre-commit.d/detect-secrets.sh ./$REPO_BUILD/$REPO_NAME/.git/hooks/pre-commit.d
done

echo -e '\nInstalling to Other Builds...'
for repo in ${OTHER_BUILDS[@]}; do
	REPO_BUILD=other
	REPO_NAME=$repo
	echo -e "...$repo"
	mkdir -p ./$REPO_BUILD/$REPO_NAME/.git/hooks/pre-commit.d
	cp ./git-hooks/git-multi-hook.sh ./$REPO_BUILD/$REPO_NAME/.git/hooks/pre-commit
	cp ./git-hooks/hooks/pre-commit.d/detect-secrets.sh ./$REPO_BUILD/$REPO_NAME/.git/hooks/pre-commit.d
done

echo -e '\nDONE ..!'
