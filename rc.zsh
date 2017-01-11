
unsetopt share_history

# [[ $TERM != "screen" ]] && exec tmux

# Initialize colors.
autoload -U colors
colors

source "$(dirname "$0")"/alias.sh
source "$(dirname "$0")"/paths.sh
source "$(dirname "$0")"/transfer.sh


function git_current_branch() {
    ingit=`git rev-parse --is-inside-work-tree 2>/dev/null`
    if [ "$ingit" = "true" ]; then
        ref=$(git symbolic-ref HEAD 2> /dev/null) || \
        ref=$(git rev-parse --short HEAD 2> /dev/null) || return
        echo " [ ${ref#refs/heads/} ]"
    fi
}

PROMPT='%{$fg_bold[green]%}%p %{$fg[yellow]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$fg_bold[white]%}➤ %{$reset_color%}'
 
ZSH_THEME_GIT_PROMPT_PREFIX="%{$bg[blue]%}%{$fg[white]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}⚡ %{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[white]%}✓ %{$reset_color%} "

# custom tab name
function precmd {
  
  if [[ `uname` == 'Darwin' ]]
  then
    echo -ne "\e]1;${PWD//*\//} $(git_prompt_info)\a"
  else
    print -Pn "\e]0;$(pwd | sed -e "s,^$HOME,~,")$(git_current_branch)\a"
  fi
}
