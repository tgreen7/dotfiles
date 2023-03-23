#                                      __             
#                                     /\ \__          
#     __   __  _  _____     ___   _ __\ \ ,_\   ____  
#   /'__`\/\ \/'\/\ '__`\  / __`\/\`'__\ \ \/  /',__\ 
#  /\  __/\/>  </\ \ \L\ \/\ \L\ \ \ \/ \ \ \_/\__, `\
#  \ \____\/\_/\_\\ \ ,__/\ \____/\ \_\  \ \__\/\____/
#   \/____/\//\/_/ \ \ \/  \/___/  \/_/   \/__/\/___/ 
#                   \ \_\                             
#                    \/_/                             


export EDITOR="code";
export GREP_OPTIONS="--color=auto";
export HISTSIZE=10000 # 32768; # Larger bash history (allow 32³ entries; default is 500)
export HISTFILESIZE=$HISTSIZE;
export HISTIGNORE="ls:cd:pwd:exit:cd .."; #ls:cd:pwd:exit:cd ..:"; # Make some commands not show up in history
export HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..)";
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";
export trc="teselagen-react-components";
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_281)