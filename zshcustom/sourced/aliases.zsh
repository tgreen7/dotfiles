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
alias ohmyzsh='$EDITOR ~/dotfiles/zshcustom'

alias s='$EDITOR'

alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

alias ls='ls -FG'

alias f='open -a Finder ./'         # f:            Opens current directory in MacOS Finder

alias path='echo -e ${PATH//:/\\n}' # path:         Echo all executable Paths

alias findve='open -a Finder ~/Sites/ve'
alias ve='$EDITOR ~/Sites/ve'

# connect to remote file system
alias ucsc='sshfs tmgreen@unix.ucsc.edu:/afs/cats.ucsc.edu/users/c/tmgreen Remote'

# docker
alias dockkill='docker-compose down'

#projects
alias website='subl ~/git/tgreen7'
alias editweb='sshfs -p 21098 taohpjgs@server221.web-hosting.com:/ Remote'

#yarn
alias ys='yarn start'
alias ya='yarn add'
alias yr='yarn remove'
alias yui='yarn upgrade-interactive --latest'
alias yb='yarn build'

# Install dependencies globally
alias npmg="npm i -g"

# Install and save to dependencies in your package.json
# npms is used by https://www.npmjs.com/package/npms
alias npmd="npm i --save-dev"

# Install and save to dev-dependencies in your package.json
# npmd is used by https://github.com/dominictarr/npmd
alias npms="npm i --save"

alias npmr="npm run"

# Teselagen
tes='docker run -p 3000:3000 --privileged --rm -ti -e HIST_FILE=/root/.bash_history'
tes+=' -v ~/.bash_history:/root/.bash_history -v ~/Sites/tesela_bashrc.txt:/root/.bashrc'
tes+=' -v ~/Sites/j5:/usr/local/share/perl5/Bio/Tools/j5_source/ -v ~/Sites/ve:/home/teselagen/ve'
tes+=' -v ~/Sites/appconfig.docker.json:/home/teselagen/ve/api_server_bookshelf/appconfig.docker.json'
tes+=' dev.teselagen.com:5000/newdev /bin/bash'
alias tes=$tes
alias tedocker='cd ~/Sites/ve; appimagename=dev.teselagen.com:5000/newdev docker-compose run -p 3000:3000 -p 9229:9229 app'
alias dropAndUpdate='docker exec -it ve_db /bin/bash /dockerScripts/dropAndCreateSchema.sh'
alias randomUsers='docker exec -it ve_db /bin/bash /dockerScripts/randomUsers.sh'
alias viewDbStartupProgress='docker logs -f ve_db'
alias senchasass='cd ~/Sites/ve/vede; sencha ant sass'

# git
alias glog="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short --all --since=1.days.ago --author=Taoh"
alias glog2="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short --all --since=2.days.ago --author=Taoh"
alias glog3="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short --all --since=3.days.ago --until=2.days.ago --author=Taoh"

alias gst="git stash"
alias gsta="git stash apply"
alias gs="git status"
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --shortstat"
alias gm='git merge'
alias gb='git branch'
alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias greset='git reset --hard HEAD'
alias gh='open $(git config remote.origin.url)'

alias gdelete='git branch --merged | egrep -v "(^\*|master|qa)" | xargs git branch -d'

# alias lims='osascript ~/Sites/scripts/launch-lims.scpt'
alias limsclient='cd ~/Sites/lims && ys'
alias limsserver='cd ~/Sites/lims/server && ys'
alias limsdev='ssh -i "~/.ssh/teselagen_dev.pem" ubuntu@ec2-52-9-77-80.us-west-1.compute.amazonaws.com'

alias qa='gco qa && git merge master && git push origin qa && gco master'
# sudo -s
# docker exec -ti lims_app bash
