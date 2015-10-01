#!/bin/bash

function install_link {
    FILE="$1"
    DOTFILE="$HOME/.`basename "$FILE"`"
    if [[ -f "`dirname "$FILE"`/.`basename "$FILE"`-nolink" ]]
    then
        echo "nolink file exists for $FILE -- not linking."
        return
    fi

    if [[ "$FILE" =~ .local$ ]]
    then
        echo "Not linking .local file $FILE"
        return
    fi

    if [[ -e "$DOTFILE" || -h "$DOTFILE" ]]
    then
        if [[ $NO_REPLACE ]]
        then
            RESP=n
        else
            read -p "$FILE already exists.  Backup then replace? [yN] " RESP 
        fi
        if [[ "$RESP" != "y" && "$RESP" != "Y" ]]
        then
            echo "Not replacing $DOTFILE"
            return
        else
            mv -i "$DOTFILE" "$DOTFILE.old.$PPID" || exit
            echo "A backup of $DOTFILE has been made at $DOTFILE.old.$PPID"
        fi
    fi
    ln -s "`pwd`/$FILE" "$DOTFILE" || exit
    echo "$FILE --> $DOTFILE"
}

if [[ "`basename "$0"`" != "install_links.sh" ]]
then  # We may be executed as a script
    return
fi

cd "`dirname "$0"`"
touch ~/.profile_local

if [[ "$1" == "-n" ]]
then
    NO_REPLACE=1
fi

for FILE in *
do
    install_link "$FILE" 
done
