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
	git add .
	git commit -am "$1"
	npm version patch && npm publish && git pull && git push
}
pubminor() {
	git pull
	git add .
	git commit -am "$1"
	npm version minor && npm publish && git pull && git push
}
pubmajor() {
	git pull
	git add .
	git commit -am "$1"
	npm version major && npm publish && git pull && git push
}

# usage: pubminorgithub "adding a new feature"
pubpatchgithub() {
	git pull && git add . && git commit -am "$1"
	npm version patch && git tag -m "$1" -a $(node -p "require('./package.json').version") && git pull && git push && git push origin --tags && printf "###################\n\n You can install this commit using:\n\n yarn add $(node -p "require('./package.json').repository")#$(node -p "require('./package.json').version") \n\n ################## \n"
}
pubminorgithub() {
	git pull && git add . && git commit -am "$1"
	npm version minor && git tag -m "$1" -a $(node -p "require('./package.json').version") && git pull && git push && git push origin --tags && printf "###################\n\n You can install this commit using:\n\n yarn add $(node -p "require('./package.json').repository")#$(node -p "require('./package.json').version") \n\n ################## \n"
}
pubmajorgithub() {
	git pull && git add . && git commit -am "$1"
	npm version major && git tag -m "$1" -a $(node -p "require('./package.json').version") && git pull && git push && git push origin --tags && printf "###################\n\n You can install this commit using:\n\n yarn add $(node -p "require('./package.json').repository")#$(node -p "require('./package.json').version") \n\n ################## \n"
}
