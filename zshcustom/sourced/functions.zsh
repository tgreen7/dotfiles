#     ___                         __
#   /'___\                       /\ \__  __
#  /\ \__/  __  __    ___     ___\ \ ,_\/\_\    ___     ___     ____
#  \ \ ,__\/\ \/\ \ /' _ `\  /'___\ \ \/\/\ \  / __`\ /' _ `\  /',__\
#   \ \ \_/\ \ \_\ \/\ \/\ \/\ \__/\ \ \_\ \ \/\ \L\ \/\ \/\ \/\__, `\
#    \ \_\  \ \____/\ \_\ \_\ \____\\ \__\\ \_\ \____/\ \_\ \_\/\____/
#     \/_/   \/___/  \/_/\/_/\/____/ \/__/ \/_/\/___/  \/_/\/_/\/___/
#
#

function mcd() {
	mkdir -pv $1
	cd $1
}

# creates git ignore for language specified
function gi() {
	curl -L -s https://www.gitignore.io/api/$@
}

# attaches to docker container of id passed to it
function attach() {
	docker exec -it $1 bash
}

gcam() {
	git add -A
	git commit -m "$1" $2
}

gcamn() {
	git add -A
	PRECOMMIT_LINT="" git commit -m "$1" $2
}

# usage: pubminor "adding a new feature"
pubpatch() {
	git pull
	git add -A
	git commit -am "$1"
	npm version patch && npm publish
	git add -A
	git commit -m "publishing new patch"
	git push
}
pubminor() {
	git pull
	git add -A
	git commit -m "$1"
	npm version minor && npm publish
	git add -A
	git commit -m "publishing new minor"
	git push
}
pubmajor() {
	git pull
	git add -A
	git commit -m "$1"
	npm version major && npm publish
	git add -A
	git commit -m "publishing new major"
	git push
}

pubpatchbeta() {
	git pull
	git add -A
	git commit -m "$1"
	npm version patch && npm publish --tag beta
	git add -A
	git commit -m "publishing new beta patch"
	git push
}
pubminorbeta() {
	git pull
	git add -A
	git commit -m "$1"
	npm version minor && npm publish --tag beta
	git add -A
	git commit -m "publishing new beta minor"
	git push
}
pubmajorbeta() {
	git pull
	git add -A
	git commit -m "$1"
	npm version major && npm publish --tag beta
	git add -A
	git commit -m "publishing new beta major"
	git push
}

gupdate() {
	gco $1
	gmm
	ggpush
}

gbh() { #git branch history (show the 30 most recent branches)
	git reflog | grep -E -io "moving from ([^[:space:]]+)" | awk '{ print $3 }' | awk ' !x[$0]++' | grep -E -v '^[a-f0-9]{40}$' | head -n10
}

prlogs() {
	open "https://console.cloud.google.com/kubernetes/deployment/us-central1-a/dev-cluster/pr-app-$1/tg-app/logs?authuser=1&project=tg-cluster-dev"
}

# tester() {
# 	echo "$1"
# 	echo "$(git_current_branch)"
# 	if [[ "$(git_current_branch)" == "$1" ]]; then
# 	 	echo "on branch"
# 	else
# 	  echo "not on branch"
# 	fi
# }

gcob() {
	if [ -z $1 ]; then
		echo "Please pass branch name"
		return
	fi
	wasStashed=false
	if [[ "$(git_current_branch)" != "master" ]]; then
		if gst | grep -q 'No local changes'; then
		else
			wasStashed=true
		fi
		gco master
	fi
	ggpull
	gco -b $1
	if $wasStashed; then
		git stash pop
	fi
}

# checkout a new branch, commit and push local changes, start a PR -- gcbpr newBranch 'added new feature xyz'
gcbpr() {
	gcob $1
	gcam $2
	ggpush
	gh pr create --web
}

cypressDocker() {
	cd ~/Sites/lims/e2e-tests
	# docker run --env CYPRESS_BASE_URL="http://host.docker.internal:3000/" \
	docker run --env CYPRESS_BASE_URL="https://pr-app-8514.teselagen.net/" \
		--env CYPRESS_TEST_FILES="**/build/Tools/idtOrdering.js" \
		-it -v $PWD/../tg-iso-shared:/tg-iso-shared -w /tg-iso-shared -v $PWD:/e2e -w /e2e cypress/included:8.5.0

	# not working trying to get runner to show
	# IP=$(ipconfig getifaddr en0)
	# DISPLAY=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
	# echo $DISPLAY
	# docker run --rm --name firefox \
	# 	-e DISPLAY=$DISPLAY:0 \
	# 	-e XAUTHORITY=/.Xauthority \
	# 	-v ~/.Xauthority:/.Xauthority \
	# 	jess/firefox
	# cd ~/Sites/lims/e2e-tests
	# docker run \
	# 	--env CYPRESS_BASE_URL="http://host.docker.internal:3000/" --env CYPRESS_TEST_FILES="**/dataSets.js" \
	# 	-it \
	# 	-v $PWD/../tg-iso-shared:/tg-iso-shared -w /tg-iso-shared \
	# 	-v $PWD:/e2e \
	# 	-v /tmp/.X11-unix:/tmp/.X11-unix \
	# 	-e DISPLAY=$DISPLAY:0 \
	# 	-e XAUTHORITY=/.Xauthority \
	# 	-v ~/.Xauthority:/.Xauthority \
	# 	-w /e2e \
	# 	--entrypoint cypress \
	# 	cypress/included:8.5.0 open --project .
}

killport() {
	lsof -i tcp:${1} | awk 'NR!=1 {print $2}' | xargs kill -9
}

updateJ5Parser() {
	echo "make sure you're at the root of the lims repo"
	cd j5-parser &&
		pubpatchsimple &&
		cd ../microservice/microservices/j5 &&
		yarn add @teselagen/j5-parser@latest &&
		pubpatchsimple &&
		echo "################"
	echo "#####SUCCESS####"
	echo "################"
	echo "now go to microservice/microservice-workers/express-js-worker/task-runner.config.json and update the @teselagen/j5 there"
}

pubpatchsimple() {
	npm version patch && npm publish
}
