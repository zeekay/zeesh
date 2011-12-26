#!/usr/bin/env zsh
# tries to silently check for upgrades after login in the background
if [ $1 ]; then

    # change dir to repo
    cd $1
    if [[ `hg id | cut -d ' ' -f 1` != `hg id default | cut -d ' ' -f 1` ]]; then
        hg pull > /dev/null
        hg up > /dev/null
    fi
else
    echo 'requires path to repo'
fi
