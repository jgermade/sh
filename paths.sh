

if [ -f "$HOME/.config/go" ]; then
	export GOPATH=$HOME/.config/go   
else
  export GOPATH=$HOME/.golang
fi

export GOBIN=$GOPATH/bin

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi