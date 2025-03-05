#!/usr/bin/env zsh
## ================================================================================================================== ##
##	NAME: 	update-symlinks.sh
##	AUTHOR: Skye Benson (@skyeBreach) <skyebreach@proton.me>
##
##  USAGE:
##		${NAME} ${ARG_FLAG} ${ARG_OPT} ${ARG_POS}
##
## 	DESCRIPTION:
##    	${DESCRIPTION}
##
## 	ARGUMENTS:
##    	${ARG_TYPE}		${ARG_SHORT}	${ARG_LONG}		${ARG_DESCRIPTION}		(default=${ARG_DEFAULT})
##
## 	EXAMPLES:
##    	${Example}
##
## ------------------------------------------------------------------------------------------------------------------ ##
## 	METADATA:
##    	Version			v0.1.0
##    	License			MIT
##		CREATED			2025/03/05
##		MODIFIED		2025/03/03
##
##
## ------------------------------------------------------------------------------------------------------------------ ##
##  TODO:
##      - Improve the error handling, and formatting 
##      - Implement path ignoring 
##      - Increment tar name if it already exists
##
## ------------------------------------------------------------------------------------------------------------------ ##
##  HISTORY:
##     	[2025/03/05] <@skyeBreach> feat	: Script creation
##
## ================================================================================================================== ##

##
set -o errexit


## Associative array to store the scripts options 
declare -A OPTS=(
    ["backup"]=0
)

## Get the cli args
while getopts "b" arg; do
  case $arg in
    b)
      OPTS[backup]=1
      ;;
  esac
done

## Script helper vars
SCRIPT_DIR=$(basename $(dirname $0))
SCRIPT_NAME=$(basename $0)

## Destination Paths
PATH_DEST_HOME="/home/$USER"

## ------------------------------------------------------------------------------------------------------------------ ##
## Validate Call Location 

## Refuse any calls of this script that are not called from the repo dir, or scripts folder
if [ ! -e "$PWD/$SCRIPT_DIR/$SCRIPT_NAME" ] && [ ! -e "$PWD/$SCRIPT_NAME" ]; then
    echo "This script must be called from the repo root, or scripts directory!"
    exit 2
fi

## Set the root path based on the call location
ROOT_PATH=$([ -e "$PWD/$SCRIPT_NAME" ] && echo "$(realpath $PWD/..)" || echo $PWD)

## ------------------------------------------------------------------------------------------------------------------ ##
## Find DotFiles

## Find all relative paths for the dotfiles in this repo that belong in the `~` directory
declare -a PATH_DOTFILES_HOME=($(find $ROOT_PATH/home/ -type f -printf "%P\n"))

## ------------------------------------------------------------------------------------------------------------------ ##
## Backup dot files

if [ $OPTS[backup] -eq 1 ]; then
    DIR_BACKUP=$ROOT_PATH/.backup
    DIR_BACKUP_TEMP=$DIR_BACKUP/.temp

    for file in $PATH_DOTFILES_HOME; do
        ## Store destination path for file
        file_dest=$PATH_DEST_HOME/$file
        file=home/$file

        ## Store any non-symlink files that exist in dest of file for backup
        if [ -e $file_dest ] && [ ! "$(stat -c %h -- "$file_dest")" -gt 1 ]; then
            [ ! -d $DIR_BACKUP_TEMP/$(dirname $file) ] && mkdir -p $DIR_BACKUP_TEMP/$(dirname $file)
            cp $file_dest $DIR_BACKUP_TEMP/$file
        fi
    done

    ## Compress the backup into tar.gz archive and store in backup
    if [ $OPTS[backup] -eq 1 ] && [ -d $DIR_BACKUP_TEMP ]; then
        [ ! -d $DIR_BACKUP ] && mkdir -p $DIR_BACKUP
        FILE_BACKUP_NAME=backup-$(date +%s%N | cut -b1-13)
        tar -czf $DIR_BACKUP/$FILE_BACKUP_NAME.tar.gz -C $DIR_BACKUP_TEMP ./
    fi

    ## Clean-up .temp directory
    [ -d $DIR_BACKUP_TEMP ] && rm -rf $DIR_BACKUP_TEMP
fi 

## ------------------------------------------------------------------------------------------------------------------ ##
## Symbolic Linking

## Create symbolic links
for file in $PATH_DOTFILES_HOME; do
    ln -sf $ROOT_PATH/home/$file $PATH_DEST_HOME/$file
done

## Exit with success code
exit 0

## ------------------------------------------------------------------------------------------------------------------ ##
