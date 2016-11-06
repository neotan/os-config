#!/bin/bash
PATH=$PATH:/bin:/usr/local/bin
export PATH

# Color
NC='\033[0m' # No Color
LRED='\033[1;31m'
LGREEN='\033[1;32m'
LBLUE='\033[1;34m'
PURPLE='\033[0;35m'
GRAY='\033[1;30m'
TODAY=`date +%Y-%m-%d_%H-%M-%S`
CURRENT_PATH=`pwd`
RAMDISK_LETTER='RAMDisk'
RAMDISK_PATH='/Volumes/'${RAMDISK_LETTER}
CHROME_CACHE_PATH=${HOME}'/Library/Caches/Google/Chrome'
# Env. parameters
OS=`uname -a`

echo 
echo -e ${GRAY} "------------ RAMDisk START --------------"${NC}
echo 
# echo -e "[ Env. ]: ${LBLUE} $OS ${NC}"
# echo -e "[ Now ]: ${LBLUE} $TODAY ${NC}"
# echo -e "[ Current Working Path ]: "${LBLUE} $CURRENT_PATH ${NC}
# echo -e "[ Current User ]: " ${LBLUE} $USER ${NC}

echo -e "${LBLUE}[Env.]:${NC} $OS" 
echo -e "${LBLUE}[Now]:${NC} $TODAY"
echo -e "${LBLUE}[Current Working Path]:${NC} $CURRENT_PATH"
echo -e "${LBLUE}[Current User]:${NC} $USER"

# Prompt to input a expected RAMDisk size to be created.
echo -e ${LGREEN}
read -p "!!! Please CLOSE Chrome first !!! Then input RAMDisk size(MB) you want (128M): " size
echo -e ${NC}

if [[ $size =~ ^-?[0-9]+$ ]]
then
    let "size=${size}*2048"
else
    let "size=128*2048"
fi
echo -e "Input size(M): " ${LBLUE}"[ ${size} ]"${NC}

# Create and mount RAMDisk 
diskutil eject ${RAMDISK_LETTER}
diskutil erasevolume HFS+ 'RAMDisk' `hdiutil attach -nomount ram://${size}`
echo

echo -e ${LGREEN}
read -p "Auto-mount the RANDisk while OS startup?(y/n): " -n 1 -r
echo -e ${NC}

if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Config 'fstab' to build RAMDisk once OS was booted up.
    echo -e ${GRAY} "-----------------------------------"${NC}
    #echo -e ${GRAY} " diskutil erasevolume HFS+ 'RAMDisk' `hdiutil attach -nomount ram://${size}`"${NC}
    echo -e ${GRAY} "-----------------------------------"${NC}
    #sudo su -c "echo 'tmpfs ${RAMDISK_PATH} tmpfs nodev,nosuid,noexec,nodiratime,size=${size} 0 0' >> /etc/fstab"
    #sudo su -c "echo 'diskutil erasevolume HFS+ 'RAMDisk' `hdiutil attach -nomount ram://${size}`' >> /private/etc/fstab"
    echo
fi

echo -e ${GRAY} "------------- df -h ---------------"${NC}
df -h

echo -e ${LGREEN}
read -p "Redirect the Chrome Cache path to RAMDisk?(y/n): " -n 1 -r
echo -e ${NC}

if [[ $REPLY =~ ^[Yy]$ ]]
then
		# Remove existing Cache folder.
        rm -rf ${CHROME_CACHE_PATH}

		# Make link to link up 'RAMDisk' folder and Chrome Cache folder.
        ln -s ${RAMDISK_PATH} ${CHROME_CACHE_PATH} 

		# Chang 'RAMDisk''s owner to current user.
        chown -R ${USER}:staff ${RAMDISK_PATH} 
fi
echo
echo -e ${GRAY} "---------- tree ${RAMDISK_PATH} ------------"${NC}
tree ${RAMDISK_PATH}
echo
echo -e ${GRAY} "---------- ${CHROME_CACHE_PATH} -------"${NC}
echo -e ${LBLUE}
ls -la ${CHROME_CACHE_PATH}
echo -e ${NC}
echo -e ${GRAY} "------------- RAMDisk END ---------------"${NC}

