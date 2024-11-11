# some more ls aliases
# alias ls='ls --color=auto'
alias ll='ls -alF'
alias l='ls -alF'

alias c='clear'
alias .='echo $PWD'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ~='cd ~'

alias nuke='rm -rf'

alias gc='git checkout'
alias gb='git branch'
alias fetch='git fetch origin'

alias default-remote="git symbolic-ref refs/remotes/origin/HEAD --short | sed 's@^origin/@@'"

alias pull='echo "Pulling from branch: $(git symbolic-ref --short HEAD)" && git pull origin $(git symbolic-ref --short HEAD)'
alias push='echo "Pushing to branch: $(git symbolic-ref --short HEAD)" && git push origin $(git symbolic-ref --short HEAD)'


alias 'ssh-pass'='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'

# grep -i cron /var/log/syslog|tail -10

function randpass() {
  openssl rand -base64 37 | sed -e "s/^\(.\{37\}\).*/\1/g"
}

function nginx-errors () {
  if [ -z "$1" ]; then         # Is parameter #1 zero length?
    if [[ `uname` == 'Darwin' ]]; then
      tail /usr/local/var/log/nginx/error.log
    else
      tail /var/log/nginx/error.log
    fi
  else
    if [[ "$1" == 'full' ]]; then
      if [[ `uname` == 'Darwin' ]]
      then
        cat /usr/local/var/log/nginx/error.log
      else
        cat /var/log/nginx/error.log
      fi
    else
      echo "bad argument"
    	exit 2
    fi
  fi
}

if [ -d "${HOME}/.nvm/.git" ]; then
cd () {
  builtin cd "$@"
  if [[ -f .nvmrc ]];then nvm use > /dev/null; fi
}
fi

cd .
