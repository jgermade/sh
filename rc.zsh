
autoload -U colors && colors

source "$(dirname "$0")"/alias.sh

function git_dirty_symbol () {
  local pstatus=$(git status --porcelain 2> /dev/null)

  if [[ -z $pstatus ]];then
    echo ''
  else
    echo ' ⚡'
  fi
}

function git_branch_name () {
  local branch=$(git branch --show-current 2> /dev/null | xargs)

  if [[ -z $branch ]];then
    echo ''
  else
    echo ' %K{blue} '$branch$(git_dirty_symbol)' %K{reset}'
  fi
}

setopt prompt_subst

prompt=' %F{yellow}%~%F{reset}$(git_branch_name) ▸ '

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

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

