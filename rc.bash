#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/alias.sh
source $DIR/paths.sh
source $DIR/transfer.sh

unset color_prompt force_color_prompt
export PS1=' \e[93m\w $(__git_ps1 "\e[44;97m %s \e[49m ")\[\033[01;39m\]➤\[\033[00m\] '