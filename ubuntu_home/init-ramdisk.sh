#!/bin/bash
PATH=$PATH:/bin:/usr/local/bin
export PATH

# Color
NC='\033[0m' # No Color
LRED='\033[1;31m'
LGREEN='\033[1;32m'
LBLUE='\033[1;34m'
PURPLE='\033[0;35m'
TODAY=`date +%Y-%m-%d_%H-%M-%S`
CURRENT_PATH=`pwd`
RAMDISK_PATH='/mnt/ramdisk'
CHROME_CACHE_PATH=${HOME}'/.cache/google-chrome'

# Env. parameters
OS=`uname -a`

echo 
echo -e ${PURPLE} "------------ Ramdisk START --------------"${NC}
echo 
# echo -e "[ Env. ]: ${LBLUE} $OS ${NC}"
# echo -e "[ Now ]: ${LBLUE} $TODAY ${NC}"
# echo -e "[ Current Working Path ]: "${LBLUE} $CURRENT_PATH ${NC}
# echo -e "[ Current User ]: " ${LBLUE} $USER ${NC}

echo -e "${LBLUE}[Env.]:${NC} $OS" 
echo -e "${LBLUE}[Now]:${NC} $TODAY"
echo -e "${LBLUE}[Current Working Path]:${NC} $CURRENT_PATH"
echo -e "${LBLUE}[Current User]:${NC} $USER"


# Create folder for ramdisk
if [ ! $RAMDISK_PATH ]
    then `sudo mkdir -p $RAMDISK_PATH`
	echo -e ${LBLUE}"[ $RAMDISK_PATH ] is created."${NC}
fi

# Show current RAM usage.
echo
echo -e ${PURPLE} "------------- free -g ---------------"${NC}
free -g

# Prompt to input a expected ramdisk size to be created.
echo -e ${LGREEN}
read -p "Ramdisk size(MB) you want (128M): " size
echo -e ${NC}

if [[ $size =~ ^-?[0-9]+$ ]]
then
    size="${size}M"
else
    size="128M"
fi
echo -e "Input size(m): " ${LBLUE}"[ $size ]"${NC}

# Mount created folder 'ramdisk' as a temp file system
sudo mount -t tmpfs -o size=$size tmpfs $RAMDISK_PATH
echo

# Config '/etc/fstab' to build Ramdisk once OS was booted up.
echo -e ${PURPLE} "-----------------------------------"${NC}
echo -e ${PURPLE} "- echo 'tmpfs /mnt/ramdisk tmpfs nodev,nosuid,noexec,nodiratime,size=128M 0 0' >> /etc/fsta -----"${NC}
echo -e ${PURPLE} "-----------------------------------"${NC}
sudo su -c "echo 'tmpfs $RAMDISK_PATH tmpfs nodev,nosuid,noexec,nodiratime,size=${size} 0 0' >> /etc/fstab"
echo

echo -e ${PURPLE} "------------- df -h ---------------"${NC}
df -h

echo -e ${LGREEN}
read -p "Redirect the Chrome Cache path to Ramdisk?(y/n): " -n 1 -r
echo -e ${NC}

if [[ $REPLY =~ ^[Yy]$ ]]
then
		# Remove existing Cache folder.
        rm -rf $CHROME_CACHE_PATH

		# Create 'ramdisk' in Ramdisk.
        #sudo mkdir ${RAMDISK_PATH}/google-chrome

		# Make link to link up 'ramdisk' folder and Chrome Cache folderyy.
        ln -s ${RAMDISK_PATH} $CHROME_CACHE_PATH 

		# Chang 'ramdisk''s owner to current user.
        sudo chown -R ${USER}:${USER} $RAMDISK_PATH 
fi
echo
echo -e ${PURPLE} "---------- $RAMDISK_PATH ------------"${NC}
tree $RAMDISK_PATH
echo
echo -e ${PURPLE} "---------- $CHROME_CACHE_PATH -------"${NC}
echo -e ${LBLUE}
ls -la $CHROME_CACHE_PATH
echo -e ${NC}
#tree $CHROME_CACHE_PATH
echo -e ${PURPLE} "------------- Ramdisk END ---------------"${NC}

