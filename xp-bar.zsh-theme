# Theme with full path names and hostname
# Handy if you work on different servers all the time;
prompt_end() {
  # printf "\n$ ";
  printf "\n ";
}

function get_right_prompt() {
    [[ $(print -P "%#") == '#' ]] && echo -e "\uf503" || echo -e "\uf512"
}

function get_left_prompt() {
    if [[ $(tput cols) -ge 100 ]]; then
        echo -n "%{$fg[green]%}%n %{$fg[yellow]%}@ %B%{$fg[cyan]%}%M%b $light_yellow%~%{$reset_color%}%{$reset_color%}$(git_prompt_info)%{$reset_color%}"
    else
        echo -n "%{$fg[green]%}%n %{$fg[yellow]%}@ %B%{$fg[cyan]%}%M%b $light_yellow%~%{$reset_color%}%{$reset_color%}%{$reset_color%}"
    fi

}


eval light_yellow='$FG[227]'
eval git_info_color='$fg[red]'

#PROMPT='%{$fg[green]%}%n %{$fg[yellow]%}@ %B%{$fg[cyan]%}%M%b $light_yellow%~%{$reset_color%}%{$reset_color%}$(git_prompt_info)%{$reset_color%}$(prompt_end)'
#RPROMPT='%@'

PROMPT='$(get_left_prompt)$(prompt_end)'
RPROMPT='$(get_right_prompt)'

#PROMPT='# '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$git_info_color%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$git_info_color%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"

