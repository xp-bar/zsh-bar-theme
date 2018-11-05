# Theme with full path names and hostname
# Handy if you work on different servers all the time;
prompt_end() {
  printf "\n$ ";
  # printf "\n ";
}

MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

function get_right_prompt() {
   echo -e "MODE: $(vi_mode_prompt_info)" 
}

function get_left_prompt() {
    if [[ $(tput cols) -ge 100 ]]; then
        echo -n "%{$fg[green]%}%n %{$fg[yellow]%}$(get_platform_icon) %B%{$fg[cyan]%}%M%b $light_yellow%~%{$reset_color%}%{$reset_color%}$(git_prompt_info)%{$reset_color%}"
    else
        echo -n "%{$fg[green]%}%n %{$fg[yellow]%}$(get_platform_icon) %B%{$fg[cyan]%}%M%b $light_yellow%~%{$reset_color%}%{$reset_color%}%{$reset_color%}"
    fi
}

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

