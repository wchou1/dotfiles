#!/bin/bash

declare -a SYMFILES=(
#--------------------------------{-NEOVIM-}-----------------------------------
'editor/init.vim'            # Source
'~/.config/nvim/init.vim'    # Destination
#--------------------------------{-ZSHELL-}------------------------------------
'shell/zshrc'                # Source
'~/.zshrc'                   # Destination
#--------------------------------{-TMUX-}-------------------------------------
'mux/tmux.conf'              # Source
'~/.tmux.conf'               # Destination
'mux/tmuxline.conf'          # Source
'~/.tmuxline.conf'           # Destination
#--------------------------------{-GIT-}--------------------------------------
'vcs/gitconfig'              # Source
'~/.gitconfig'               # Destination
#-----------------------------------------------------------------------------
)


execute() {
    $1 &> /dev/null
    print_result $? "${2:-$1}"
}

print_success() {
    # Print output in green
    printf "\e[0;32m  [✔] $1\e[0m\n"
}

print_error() {
    # Print output in red
    printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

print_info() {
    # Print output in purple
    printf "\n\e[0;35m $1\e[0m\n\n"
}

print_question() {
    # Print output in yellow
    printf "\e[0;33m  [?] $1\e[0m"
}

print_result() {
    [ $1 -eq 0 ] \
        && print_success "$2" \
        || print_error "$2"

    [ "$3" == "true" ] && [ $1 -ne 0 ] \
        && exit
}

ask_for_confirmation() {
  print_question "$1 (y/n) "
  read -n 1
  printf "\n"
}

main() {
    local i=''
    local sourceFile=''
    local targetFile=''
    #------------------------------------------------------------------------------
    for (( i=0; i<${#SYMFILES[@]}; i=i+2 )); 
    do
        sourceFile=${SYMFILES[$i]}
        targetFile=${SYMFILES[$i+1]} 
        if [ ! -e "$targetFile" ]; then
            execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        elif [ "$(readlink "$targetFile")" == "$sourceFile"]; then
            print_success "$targetFile → $sourceFile"
        else
            ask_for_confirmation "'$targetFile' already exists, overwrite?"
            if answer_is_yes; then
                rm -rf "$targetFile"
                execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
            else
                print_success "$targetFile → $sourceFile"
            fi
        fi
    done

    nvim +PlugClean +PlugInstall +PlugUpgrade +PlugUpdate +qall
}

main
