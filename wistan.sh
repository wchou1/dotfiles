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

install_brew () {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_zsh () {
  # Test to see if zshell is installed.  If it is:
  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Install Oh My Zsh if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
      chsh -s $(which zsh)
    fi
  else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
      if [[ -f /etc/redhat-release ]]; then
        sudo yum install zsh
        install_zsh
      fi
      if [[ -f /etc/debian_version ]]; then
        sudo apt-get install zsh
        install_zsh
      fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
      echo "We'll install zsh, then re-run this script!"
      brew install zsh
      exit
    fi
  fi
}

install_useful () {
  brew install tmux
  brew install pyenv
}

setup_pyenv_virtualenvs () {
  pyenv install 2.7.11
  pyenv install 3.4.4

  pyenv virtualenv 2.7.11 neovim2
  pyenv virtualenv 3.4.4 neovim3

  pyenv activate neovim2
  pip install neovim
  echo "Use following path for vimconfig 'let g:python_host_prog ='"
  pyenv which python  # Note the path

  pyenv activate neovim3
  pip install neovim
  echo "Use following path for vimconfig 'let g:python3_host_prog ='"
  pyenv which python  # Note the path
}

# install_brew
# install_useful
main
install_zsh
