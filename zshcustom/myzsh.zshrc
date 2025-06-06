#                 __
#                /\ \
#   ____     ____\ \ \___   _ __   ___
#  /\_ ,`\  /',__\\ \  _ `\/\`'__\/'___\
#  \/_/  /_/\__, `\\ \ \ \ \ \ \//\ \__/
#    /\____\/\____/ \ \_\ \_\ \_\\ \____\
#    \/____/\/___/   \/_/\/_/\/_/ \/____/
#
#

# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/Sites/dotfiles/zshcustom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="custom"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom pluttgins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
plugins=(z)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# Set path

PATH="/usr/local/bin"
PATH="$PATH:/usr/bin"
PATH="$PATH:/bin"
PATH="$PATH:/usr/sbin"
PATH="$PATH:/sbin"
PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
#python
PATH="$PATH:/opt/homebrew/Cellar/python@3.9/3.9.12/libexec/bin"
# rust
PATH="$PATH:$HOME/.cargo/bin"
PATH="/opt/homebrew/opt/libpq/bin:$PATH"


# betteromics
export BETTER_HOME=$HOME/Sites/tg-betteromics
export PYTHONPATH=$BETTER_HOME/root:$BETTER_HOME/root/betteromics_sdk

export PATH=${PATH}

export PATH="/Applications/pgsql/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export N_PREFIX="$HOME/n"
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin" # Added by n-install (see http://git.io/n-install-repo).

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# # source

for file in $ZSH_CUSTOM/sourced/*; do
	source "$file"
done

export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/} ($(git_current_branch))\007"'

eval "$(/opt/homebrew/bin/brew shellenv)"

precmd() {
	eval "$PROMPT_COMMAND"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taoh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taoh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taoh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taoh/google-cloud-sdk/completion.zsh.inc'; fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# iterm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"