
source "$(dirname "$0")"/rc.zsh

local ret_status="%(?:%{$fg_bold[white]%}➤ :%{$fg_bold[red]%}➤ %s)"
PROMPT='%{$fg[blue]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} %{$fg_bold[green]%}%p %{$fg[yellow]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}${ret_status}% %{$reset_color%}'
