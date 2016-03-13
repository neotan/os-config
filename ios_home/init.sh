#!/bin/bash
PATH=$PATH:/bin:/usr/local/bin
export PATH

NC='\033[0m' # No Color
LRED='\033[1;31m'
LGREEN='\033[1;32m'
LBLUE='\033[1;34m'
PURPLE='\033[0;35m'
TODAY=`date +%Y-%m-%d_%H-%M-%S`
currentPath=`pwd`


echo "" 
echo -e ${PURPLE} "------------- Start ---------------"${NC}
echo -e ${LBLUE}"Initial work env for iOS..."
echo -e "--- Now is "$TODAY
echo -e "--- Current working path is " $currentPath ${NC}


# Backup existing config (e.g. vim, .bashrc...) and make them link to current
#  vim-config repo, so that they can always sync with current repo.

# Vim plug-ins folder
if [ ~/.vim/ ] 
    then `mv ~/.vim ~/.vim_$TODAY`
fi
ln -s $currentPath/.vim ~/.vim

# Bash config 
if [ ~/.bashrc ]
    then mv ~/.bashrc ~/.bashrc_$TODAY
fi
ln -s $currentPath/.bashrc ~/.bashrc

# Vim config file
if [ ~/.vimrc ]
    then mv ~/.vimrc ~/.vimrc_$TODAY
fi
ln -s $currentPath/.vimrc ~/.vimrc

# Common profile
ETC_PROFILE=/etc/profile
if [ $ETC_PROFILE ]
    then mv $ETC_PROFILE $ETC_PROFILE_$TODAY
    fi
ln -s $currentPath/etc_profile /etc/profile

# Cydia source list 
CYD_SRC_LIST=/var/mobile/Library/Caches/com.saurik.Cydia
if [ /etc/apt/sources.list.d/cydia.list ]
    then mv $CYD_SRC_LIST/sources.list $CYD_SRC_LIST/sources.list_$TODAY
fi
ln -s $currentPath/etc_apt_sources.list.d_cydia.list $CYD_SRC_LIST/sources.list

# Refresh the config files in current env
source /etc/profile
source ~/.bashrc 

# Install Vim plugins wint Vundle management
vim +PluginInstall +qall

mkdir -p ~/dl/local/share

# Function of listing the config files
function listfile {
    echo -e ${PURPLE} && readlink -f /etc/ && echo -e ${NC} && 
                ls -la --color=auto /etc/profile*
    echo ""
    echo -e ${PURPLE} && readlink -f /etc/apt/sources.list.d && echo -e ${NC} &&
                ls -la --color=auto /etc/apt/sources.list.d/cydia.list* 
    echo ""
    echo -e ${PURPLE} && readlink -f ~ && echo -e ${NC} &&
                ls -la --color=auto ~/.vim*
    echo ""
    echo -e ${PURPLE} && readlink -f /etc/apt/sources.list.d/ && 
                echo -e ${NC} && 
                ls -la --color=auto /etc/apt/sources.list.d/cydia.list*   
    echo ""
    echo -e ${PURPLE} "------------- Completed ---------------"
    echo ""
    echo ""
}
listfile

read -p "Do you want to DELETE all the backup files shown above?" -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
    then 
        rm  -rf ~/.vim_*
        rm   ~/.vimrc_*
        rm   ~/.bashrc_*
        rm   /etc/profile_*
        rm   /etc/apt/sources.list.d/cydia.list_*
        listfile
        echo "Deleted all the backup files, hope you won't regreti~"
fi
