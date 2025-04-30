
unsetopt share_history

# [[ $TERM != "screen" ]] && exec tmux

# Initialize colors.
autoload -U colors
colors

source "$(dirname "$0")"/alias.sh
source "$(dirname "$0")"/paths.sh
# source "$(dirname "$0")"/transfer.sh


function git_current_branch() {
    ingit=`git rev-parse --is-inside-work-tree 2>/dev/null`
    if [ "$ingit" = "true" ]; then
        ref=$(git symbolic-ref HEAD 2> /dev/null) || \
        ref=$(git rev-parse --short HEAD 2> /dev/null) || return
        echo " [ ${ref#refs/heads/} ]"
    fi
}

PROMPT='%{$reset_color%}%{$fg_bold[green]%}%p %{$fg[yellow]%}%~%{$fg[white]%}$(git_prompt_info)%{$reset_color%} %{$fg_bold[white]%}➤ %{$reset_color%}'
RPROMPT='%{$reset_color%}%{$fg[black]%}%D %T%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$bg[blue]%}%{$fg[white]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[white]%}✓"

# custom tab name
function precmd { 
  if [[ `uname` == 'Darwin' ]]
  then
    echo -ne "\e]1;${PWD//*\//} $(git_prompt_info)\a"
  else
    print -Pn "\e]0;$(pwd | sed -e "s,^$HOME,~,")$(git_current_branch)\a"
  fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -d "${HOME}/.nvm/.git" ]; then
  # echo "nvm found"

  cd () {
    builtin cd "$@"
    if [[ -f .nvmrc ]];then nvm use > /dev/null; echo "node: $(node -v)"; fi
  }

  cd .
else
  echo "nvm not found"
fi

