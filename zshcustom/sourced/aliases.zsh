#          ___
#         /\_ \    __
#     __  \//\ \  /\_\     __      ____     __    ____
#   /'__`\  \ \ \ \/\ \  /'__`\   /',__\  /'__`\ /',__\
#  /\ \L\.\_ \_\ \_\ \ \/\ \L\.\_/\__, `\/\  __//\__, `\
#  \ \__/.\_\/\____\\ \_\ \__/.\_\/\____/\ \____\/\____/

#   \/__/\/_/\/____/ \/_/\/__/\/_/\/___/  \/____/\/___/
#
#

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

alias zshconfig='$EDITOR ~/.oh-my-zsh/custom/myzsh.zshrc'
alias zshsource='source ~/.zshrc'
alias zshtheme='$EDITOR ~/.oh-my-zsh/custom/themes/custom.zsh-theme'
alias ohmyzsh='$EDITOR ~/Sites/dotfiles/zshcustom'

alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

alias ls='ls -FG'

alias f='open -a Finder ./' # f: Opens current directory in MacOS Finder

alias path='echo -e ${PATH//:/\\n}' # path: Echo all executable Paths

alias findve='open -a Finder ~/Sites/ve'
alias ve='$EDITOR ~/Sites/ve'

# connect to remote file system
alias ucsc='sshfs tmgreen@unix.ucsc.edu:/afs/cats.ucsc.edu/users/c/tmgreen Remote'

# docker
alias dockkill='docker-compose down'

#yarn
alias y='yarn'
alias ys='yarn start'
alias ya='yarn add'
alias yt='yarn test'
alias yr='yarn remove'
alias yui='yarn upgrade-interactive --latest'
alias yb='yarn build'
alias yl='yarn link'
alias yls='( ls -l node_modules ; ls -l node_modules/@* ) | grep ^l'

# Install dependencies globally
alias npmg="npm i -g"
# Install and save to dependencies in your package.json
alias npmd="npm i --save-dev"
# Install and save to dev-dependencies in your package.json
alias npms="npm i --save"
alias npmr="npm run"

# git
alias glog="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short --all --since=1.days.ago --author=Taoh"
alias glog2="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short --all --since=2.days.ago --author=Taoh"
alias glog3="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short --all --since=3.days.ago --until=2.days.ago --author=Taoh"


# unalias gst
gst() {
  if [ $1 ]; then
		git stash -u -m $1
		return
	fi
  git stash -u
}

alias gsta='git stash apply'
alias gstp='git stash pop'
alias gs='git status'
alias gco='git checkout'
alias gcom='git checkout $(git_main_branch)'
alias gd='git diff'
alias gds='git diff --shortstat'
alias gm='git merge'
alias gmm='ggpull; git fetch; git merge origin/$(git_main_branch)'
alias gb='git branch'
alias gcp='git cherry-pick'
alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias greset='git reset --hard HEAD'
alias gdelete='git branch --merged | egrep -v "(^\*|master|qa|main)" | xargs git branch -d'
alias gempty='gcam "chore: empty commit" --allow-empty && ggpush'
alias gpr='gh pr create --web'
alias gres='git reset --hard HEAD'
alias gcop='echo "🙏 praise be 🙏" && git checkout -'
alias gitmissingtext='git log -c -S' # git log -c -S'missingtext' /path/to/file
# sudo -s
# docker exec -ti lims_app bash
alias fixPackageConflicts='node ~/Sites/dotfiles/scripts/fixPackageJsonConflicts.js'
alias yarndepsrunclean='yarn clean-node-modules && yarn deps && yarn start-app-proxy'

# open slack in dev mode
alias slackdev='SLACK_DEVELOPER_MENU=true open -a /Applications/Slack.app'

alias dockerlogsmicroservice='docker logs --tail 1000 -f microservice-worker'


# gcp: wipe pr and redeploy
alias tg-gcp='npx --ignore-existing @teselagen/tg-gcp'
alias resetpr='npx --ignore-existing @teselagen/tg-gcp resetPRApp'
#then use docker exec -it /bin/bash
alias connectpr='tg-gcp connectToProjectAppEngine tg-app-dev --default'

# lims aliases
# dont override "test" alias, it is used by zsh
alias dc='cd ~/Sites/lims && DESIGN=1 yarn --cwd ~/Sites/lims/applauncher start client'
alias bc='cd ~/Sites/lims && BUILD=1 yarn --cwd ~/Sites/lims/applauncher start client'
alias tc='cd ~/Sites/lims && TEST=1 yarn --cwd ~/Sites/lims/applauncher start client'
alias ec='cd ~/Sites/lims && EVOLVE=1 yarn --cwd ~/Sites/lims/applauncher start client'
alias ysap="cd ~/Sites/lims && yarn start-app-proxy"
alias ysapforce="cd ~/Sites/lims && FORCE_SCHEMA_REFRESH=1 yarn start-app-proxy"
alias yr='cd ~/Sites/lims && yarn restart'
alias ysb='cd ~/Sites/lims && yarn start-backend'
alias ysbforce='cd ~/Sites/lims && FORCE_SCHEMA_REFRESH=1 yarn start-backend'
alias ysf='cd ~/Sites/lims && yarn start-frontend'
alias cliwatch='cd ~/Sites/lims/tg-api && yarn watch'
alias cli='cd ~/Sites/lims/tg-api && yarn build-api'

# alias app='cd ~/Sites/lims && APP=1 yarn --cwd ~/Sites/lims/applauncher start'

alias d2='cd ~/Sites/lims2 && CD_TO_FOLDER="~/Sites/lims2" DESIGN=1 yarn --cwd ~/Sites/lims2/applauncher start'
alias b2='cd ~/Sites/lims2 && CD_TO_FOLDER="~/Sites/lims2" BUILD=1 yarn --cwd ~/Sites/lims2/applauncher start'
alias b2c='cd ~/Sites/lims2 && CD_TO_FOLDER="~/Sites/lims2" BUILD=1 yarn --cwd ~/Sites/lims2/applauncher start client'
alias t2='cd ~/Sites/lims2 && CD_TO_FOLDER="~/Sites/lims2" TEST=1 yarn --cwd ~/Sites/lims2/applauncher start'
alias e2='cd ~/Sites/lims2 && CD_TO_FOLDER="~/Sites/lims2" EVOLVE=1 yarn --cwd ~/Sites/lims2/applauncher start'
alias app2='cd ~/Sites/lims2 && CD_TO_FOLDER="~/Sites/lims2" APP=1 yarn --cwd ~/Sites/lims2/applauncher start'

alias cypress='cd ~/Sites/lims && yarn c'

alias codefresh='cd ~/Sites/lims && yarn docker-build && yarn docker-build-ci && yarn run-dc; yarn c'

alias limsdocker='cd ~/Sites/lims && yarn docker-build && yarn docker-build-ci && yarn run-dc'
alias cleanj5='node ~/Sites/dotfiles/scripts/cleanJ5Report.js'

alias cleanvscode='rm -rf ~/Library/Application\ Support/Code/Cache/* && rm -rf ~/Library/Application\ Support/Code/CachedData/*'

alias cleandocker='docker volume prune; docker image prune; docker system prune;'


alias prsinglelab='npx "@teselagen/tg-gcp" gkePRToSingleLabMode'
alias dlogs='docker logs --tail 1000 -f'
alias msalert='node ~/Sites/dotfiles/alertIfMissingMSJ5.js'
