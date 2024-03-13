#!/bin/bash

DATE_STR=$(TZ=UTC-9:00 date "+%Y-%m-%d-%H-%M-%S")

if [ -f $HOME/.zshrc ]; then
    cp $HOME/.zshrc $HOME/.zshrc_backup_$DATE_STR
    rm $HOME/.zshrc
fi

# link zshrc
ln -s $(pwd)/.zshrc $HOME/.zshrc
