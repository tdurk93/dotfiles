#!/usr/bin/env bash

# the for loop wasn't working in zsh (not sure why), hence the shebang

BACKUPDIR=backup_`date +%F`_`date +%T | tr : -`
echo "making backup directory $BACKUPDIR"
mkdir $BACKUPDIR

DOTFILES=`find -maxdepth 1 -name ".*" -not -type d`
for f in $DOTFILES; do
    FILENAME="`basename $f`"
    BACKUPPATH="$BACKUPDIR/$FILENAME"
    INSTALLPATH="$HOME/$FILENAME"
    if [ -h $INSTALLPATH ]; then
        echo "found symlink at $INSTALLPATH. Removing..."
        rm $INSTALLPATH
    elif [ -d $INSTALLPATH ]; then
        echo "found directory at $INSTALLPATH. Skipping..."
        continue
    elif [ -f $INSTALLPATH ]; then
        echo "found regular file at $INSTALLPATH; moving to $BACKUPPATH..."
        mv "$INSTALLPATH" "$BACKUPPATH"
    elif [ -e $INSTALLPATH ]; then
        echo "found something strange at $INSTALLPATH. Skipping..."
        continue
    fi
    echo "creating symlink "$INSTALLPATH" -> `pwd`/$FILENAME"
    ln -s "`pwd`/$FILENAME" "$INSTALLPATH"
done
