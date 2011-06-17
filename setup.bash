#!/bin/bash
# setup.sh - sets up emacs customizations for
# git://github.com/fkchang/Emacs-customizations.git
# this will take the existing .emacs and .emacs.d and copy them to a
# different location and will setup an emacs-starter-kit based version


# backup existing emacs setup if it exists
echo "Making backups of existing emacs if necessary"
RANDOM_SUFFIX=$RANDOM
if [ -e ~/.emacs ]; then
    echo "      backing up .emacs"
    DOTEMACS_BACKUP="${HOME}/.emacs.backup$RANDOM_SUFFIX"
    mv ~/.emacs $DOTEMACS_BACKUP
fi

if [ -e ~/.emacs.d ]; then
    echo "      backing up .emacs.d"
    EMACS_DIR_BACKUP="${HOME}/.emacs.d.backup$RANDOM_SUFFIX"
    mv ~/.emacs.d $EMACS_DIR_BACKUP
fi

dir=~/emacs
if [[ ! -e $dir ]]; then
    mkdir $dir
elif [[ ! -d $dir ]]; then
    echo "$dir already exists but is not a directory" 1>&2
    exit 1
fi

# clone the starter kit and clone into  the user specific directory
echo "Cloning starter kit"
cd $dir
git clone git://github.com/technomancy/emacs-starter-kit.git
cd emacs-starter-kit
echo "Setting up emacs customizations"
git clone git://github.com/fkchang/Emacs-customizations.git $USER
cd $USER
git submodule init
git submodule update

cd emacs-rails-reloaded
git checkout master
git pull



echo "Linking files"
cd

ln -s "$dir/emacs-starter-kit" .emacs.d

echo "Done setting up emacs customizations"
if [ ! -z $DOTEMACS_BACKUP ]; then
    echo "Backed up .emacs to $DOTEMACS_BACKUP"
fi
if [ ! -z $EMACS_DIR_BACKUP ]; then
    echo "Backed up .emacs.d to $EMACS_DIR_BACKUP"
fi
echo "Start emacs and enjoy"
