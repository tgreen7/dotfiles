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
