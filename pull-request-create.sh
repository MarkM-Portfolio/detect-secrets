#!/bin/bash

echo -e '\nPull Request Create'
PINK_BUILDS=`ls ${PWD}/pink`
BLUE_BUILDS=`ls ${PWD}/blue`
# BRANCH=develop

# PINK_BUILDS='calendarbar-web-client nodejs-core orient-analysis-service orient-indexing-service orient-retrieval-service people-relationship ui-foundations utils-logger utils-pubsub'

echo -e '\nCreating PR for Pink Builds...'
for repo in ${PINK_BUILDS[@]}; do
	REPO_BUILD=pink
	REPO_NAME=$repo
	cd ./$REPO_BUILD/$REPO_NAME && ../../../../gh_config_hcl.sh
	echo -e "\nRepository: $repo Default branch: `git branch | head -n 1 | sed -e 's/* //g'`"

	git add . && git commit -m 'Create detect-secrets baseline file'
	git push
	gh repo set-default git.cwp.pnp-hcl.com/connections/$repo
	gh pr create --title "Baseline File" --body "Detect-secrets baseline file"
	# echo -e "https://git.cwp.pnp-hcl.com/connections/$repo/pulls"
	cd - >> /dev/null
done

echo -e '\nCreating PR for Blue Builds...'
for repo in ${BLUE_BUILDS[@]}; do
	REPO_BUILD=blue
	REPO_NAME=$repo
	cd ./$REPO_BUILD/$REPO_NAME && ../../../../gh_config_hcl.sh
	echo -e "\nRepository: $repo Default branch: `git branch | head -n 1 | sed -e 's/* //g'`"

	git add . && git commit -m 'Create detect-secrets baseline file'
	git push
	gh repo set-default git.cwp.pnp-hcl.com/ic/$repo
	gh pr create --title "Baseline File" --body "Detect-secrets baseline file"
	# echo -e "https://git.cwp.pnp-hcl.com/ic/$repo/pulls"
	cd - >> /dev/null
done

echo -e '\nDONE ..!'
