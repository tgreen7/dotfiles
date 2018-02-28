# mh theme
# preview: http://cl.ly/1y2x0W0E3t2C0F29043z

# features:
# path is autoshortened to ~30 characters
# displays git status (if applicable in current folder)
# turns username green if superuser, otherwise it is white

# if superuser make the username green

if [ $UID -eq 0 ]; then NCOLOR="green"; else NCOLOR="white"; fi


GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[032]

PROMPT_CHARACTER_COLOR=$FG[069]


# prompt
PROMPT='[%{$fg[$NCOLOR]%}%B%n%b%{$reset_color%}:%{$FG[197]%}%20<...<%~%<<%{$reset_color%}]%{$PROMPT_CHARACTER_COLOR%} ❯ %{$reset_color%}'
# RPROMPT='$(git_prompt_info)'
RPROMPT='$(git_prompt_status)%{$GIT_PROMPT_INFO%} $(git_prompt_info) %{$reset_color%}'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="::"
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}⬡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}⬢%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_BEHIND="%{$FG[166]%}⇣%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[green]%}⇡%{$reset_color%}"