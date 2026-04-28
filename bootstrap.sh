#!/bin/bash

SCRIPT_PATH=$(cd "$(dirname "$0")"; pwd);

for file in .ackrc .gitconfig .git.scmbrc .scm_breeze .tmux .tmux.conf .tmux.number.sh .vim; do
    if [ ! -e ~/$file ]; then
        ln -s $SCRIPT_PATH/$file ~/$file
    elif [ -L ~/$file ]; then
        rm ~/$file
        ln -s $SCRIPT_PATH/$file ~/$file
    else
        echo "Error: File exists and is not a symlink: ~/$file"
    fi
done

mkdir -p ~/.config
for dir in fish nvim; do
    if [ ! -e ~/.config/$dir ]; then
        ln -s $SCRIPT_PATH/.config/$dir ~/.config/$dir
    elif [ -L ~/.config/$dir ]; then
        rm ~/.config/$dir
        ln -s $SCRIPT_PATH/.config/$dir ~/.config/$dir
    else
        echo "Error: File exists and is not a symlink: ~/.config/$dir"
    fi
done

if [ ! -e ~/.vimrc ]; then
    ln -s $SCRIPT_PATH/.vim/vimrc ~/.vimrc
elif [ -L ~/.vimrc ]; then
    rm ~/.vimrc
    ln -s $SCRIPT_PATH/.vim/vimrc ~/.vimrc
else
    echo "Error: File exists and is not a symlink: ~/.vimrc"
fi

PLUG_VIM="$SCRIPT_PATH/.vim/autoload/plug.vim"
if [ ! -f "$PLUG_VIM" ]; then
    curl -fLo "$PLUG_VIM" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

TPM_DIR="$SCRIPT_PATH/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    mkdir -p "$SCRIPT_PATH/.tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi
