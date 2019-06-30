#!/bin/bash

print_dir_contents_links () {
    if [ $# -eq 0 ]; then
        >&2 echo "print_dir_contents: DIR parameter missing"
        return 1
    fi
    DIR=$1
    if [ ! -d $DIR ]; then
        >&2 printf "print_dir_contents: '$DIR' dir does not exists\n"
        return 1
    fi

    orgfiles=(${DIR}*.org)

    for org in ${orgfiles[@]}; do
        basename=${org##*/}
        description=${basename/.org/}

        printf "+ [[file:"${basename}"]["${description}"]]\n"

    done

    
}


export -f print_dir_contents_links
