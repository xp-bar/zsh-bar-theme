# /bin/zsh
eval light_yellow='$FG[227]'
eval git_info_color='$fg[red]'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$git_info_color%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$git_info_color%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"

MODE_INDICATOR="%{$fg[white]%}[%{$fg_bold[white]%} NORMAL %{$reset_color%}%{$fg[white]%}]%{$reset_color%}"
MODE_INSERT_INDICATOR="%{$fg[white]%}[ INSERT ]%{$reset_color%}"

function get_platform_icon() {
    if [ "$(uname)" == "Darwin" ]; then
        # Do something under Mac OS X platform        
        echo -e "\ue711";
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        # Do something under GNU/Linux platform
        echo -e "\ue712";
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
        # Do something under 32 bits Windows NT platform
        echo -e "\ue70f";
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
        # Do something under 64 bits Windows NT platform
        echo -e "\ue70f";
    fi
}

function vi_mode_indicator() {
    indicator="$(vi_mode_prompt_info)"
    if [[ $indicator != "" ]]; then
        echo -ne '\e[1 q'
        echo $indicator
    else
        echo -ne '\e[5 q'
        echo $MODE_INSERT_INDICATOR
    fi
}

function get_left_prompt() {
    if [[ $(tput cols) -ge 100 ]]; then
        echo -n "%{$fg[green]%}%n %{$fg[yellow]%}$(get_platform_icon) %B%{$fg[cyan]%}%M%b $light_yellow%~%{$reset_color%}%{$reset_color%}$(git_prompt_info) $(vi_mode_indicator)%{$reset_color%}"
    else
        echo -n "%{$fg[green]%}%n %{$fg[yellow]%}$(get_platform_icon) %B%{$fg[cyan]%}%M%b $light_yellow%~%{$reset_color%}%{$reset_color%} $(vi_mode_indicator)%{$reset_color%}"
    fi
}
function get_right_prompt() {
   # echo "" 
}

prompt_end() {
  # printf "\n$ ";
  echo -e "\n\uf105 ";
}

PROMPT='$(get_left_prompt)$(prompt_end)'
RPROMPT='$(get_right_prompt)'


