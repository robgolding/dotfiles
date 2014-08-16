#!/bin/bash

SCRIPT_PATH=$(cd "$(dirname "$0")"; pwd);

git submodule update --init

for file in .ackrc .gitconfig .git.scmbrc .redshift.conf .taskrc .tmux.conf .tmux.number.sh; do
    if [ ! -e ~/$file ]; then
        ln -s $SCRIPT_PATH/$file ~/$file
    elif [ -L ~/$file ]; then
        rm ~/$file
        ln -s $SCRIPT_PATH/$file ~/$file
    else
        echo "Error: File exists and is not a symlink: ~/$file"
    fi
done

./.zprezto/bootstrap.sh
./.vim/bootstrap.sh
