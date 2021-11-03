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
	wasStashed=true
	if gst | grep -q 'No local changes'; then
		wasStashed=false
	fi
	gco master
	ggpull
	gco -b $1
	if $wasStashed; then
		git stash pop
	fi
}
