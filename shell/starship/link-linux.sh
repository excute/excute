#!/bin/bash

if [ -f $HOME/.config/starship.toml ]; then
    rm $HOME/.config/starship.toml
fi

mkdir -p $HOME/.config

currentDirectory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

ln -s ${currentDirectory}/starship.toml $HOME/.config/starship.toml
