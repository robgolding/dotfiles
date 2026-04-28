#!/bin/bash

SCRIPT_PATH=$(cd "$(dirname "$0")"; pwd);

git submodule update --init

for file in .ackrc .gitconfig .git.scmbrc .scm_breeze .tmux .tmux.conf .tmux.number.sh; do
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

./.vim/bootstrap.sh
