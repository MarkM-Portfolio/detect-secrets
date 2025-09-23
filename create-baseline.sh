#!/bin/bash

echo -e '\nCreate Baseline Files'
PINK_BUILDS=`ls ${PWD}/pink`
BLUE_BUILDS=`ls ${PWD}/blue`
OTHER_BUILDS=`ls ${PWD}/other`

echo -e '\nCreating Baseline for Pink Builds...'
for repo in ${PINK_BUILDS[@]}; do
	REPO_BUILD=pink
	REPO_NAME=$repo
	echo -e "...$repo"
	cd ./$REPO_BUILD/$REPO_NAME && detect-secrets scan --exclude-files '/i18n/' > .detect-secrets.baseline
	cd - >> /dev/null
done

echo -e '\nCreating Baseline for Blue Builds...'
for repo in ${BLUE_BUILDS[@]}; do
	REPO_BUILD=blue
	REPO_NAME=$repo
	echo -e "...$repo"
	cd ./$REPO_BUILD/$REPO_NAME && detect-secrets scan --exclude-files '/i18n/' > .detect-secrets.baseline
	cd - >> /dev/null
done

echo -e '\nCreating Baseline for Other Builds...'
for repo in ${OTHER_BUILDS[@]}; do
	REPO_BUILD=other
	REPO_NAME=$repo
	echo -e "...$repo"
	cd ./$REPO_BUILD/$REPO_NAME && detect-secrets scan --exclude-files '/i18n/' > .detect-secrets.baseline
	cd - >> /dev/null
done

echo -e '\nDONE ..!'
