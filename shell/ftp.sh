#!/bin/bash

# Function definitions
Help() {
    cat << EOF
Commands may be abbreviated.  Commands are:

!		debug		mdir		sendport	site
$		dir		mget		put		size
account		disconnect	mkdir		pwd		status
EOF
}

ls() {
    echo "LS Function execution."
}

while true
do
    echo -n "ftp> "
    read CMD
    case $CMD in
        'help') Help ;;
        'ls') ls ;;
        'quit'|'q') break ;;
        *) echo "Invalid command" ;;
    esac
done