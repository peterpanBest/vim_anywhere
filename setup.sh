#!/bin/bash
function exe_cmd() {
    echo $1
    eval $1
}

root_dir=`pwd`

vim_alias_dir=$HOME/.vim
vim_rc=$HOME/.vimrc

if [ -e $vim_alias_dir ]; then
    exe_cmd "cp -R  $vim_alias_dir  $HOME/.vim_backup"
    exe_cmd "rm -r $vim_alias_dir"
fi 

if [ -e $vim_rc ]; then
    exe_cmd "mv $vim_rc  $HOME/.vimrc_backup"
fi

exe_cmd "ln -sf $root_dir/files/vimfiles  $vim_alias_dir"
exe_cmd "ln -sf $root_dir/files/_vimrc $vim_rc"
exe_cmd "curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh"

if [ ! -d "$vim_alias_dir/bundle/Vundle.vim" ]; then
    exe_cmd 'git clone https://github.com/VundleVim/Vundle.vim.git $vim_alias_dir/bundle/Vundle.vim'
fi


exe_cmd 'vim +PluginInstall +qall'

