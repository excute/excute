#!/bin/bash

mkdir -p $HOME/.config

currentDirectory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

rm $HOME/.config/starship.toml
ln -s ${currentDirectory}/starship.toml $HOME/.config/starship.toml
