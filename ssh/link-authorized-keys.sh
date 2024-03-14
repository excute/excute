#!/bin/bash

DATE_STR=$(TZ=UTC-9:00 date "+%Y-%m-%d-%H-%M-%S")

if [ -f $HOME/.ssh/authorized_keys ]; then
    cp $HOME/.ssh/authorized_keys $HOME/.ssh/authorized_keys_backup_$DATE_STR
    rm $HOME/.ssh/authorized_keys
fi

currentDirectory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

ln -s ${currentDirectory}/authorized_keys $HOME/.ssh/authorized_keys
