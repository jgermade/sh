

if [ -f "$HOME/.config/go" ]; then
  export GOPATH=$HOME/.config/go
else
  export GOPATH=$HOME/.golang
fi

export GOBIN=$GOPATH/bin

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

<<<<<<< Updated upstream
# if [ -d "$HOME/.local/bin" ] ; then
#   PATH="$HOME/.local/bin:$PATH"
# fi
=======
if [ -d "$HOME/.local/bin" ]; then
  PATH="$PATH:$HOME/.local/bin"
fi
>>>>>>> Stashed changes

export PATH=$PATH:$HOME/App/flutter/bin
