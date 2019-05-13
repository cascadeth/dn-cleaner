#!/bin/bash

### Check if root

RED='\033[1;31m'    # ANSI red
GRN='\033[1;32m'    # ANSI green
YLW='\033[0;33m'    # ANSI brown/orange
WHT='\033[1;37m'    # ANSI white
NC='\033[0m'        # ANSI no color

if [[ $EUID -ne 0 ]]
then
    printf "\nThis script must be run as root\n\n"
    exit 0
fi


### Check for temporary directory

if  [ ! -d ./log/ ]
then
    mkdir ./log
fi


### Get device list before cleaning

ls /dev/sd[a-z] > ./log/before

printf "\nInsert dirty drives and wait a few seconds after\nPress ${WHT}Return/Enter${NC} when ready..."
read -s -p ""

echo

### Get device list again to compare

ls /dev/sd[a-z] > ./log/after

### Get difference between before and after

grep -v -F -x -f ./log/before ./log/after > ./log/new-drives

# Check if any new drives
if [ ! -s ./log/new-drives ]
then
    printf "${YLW}No USB drives detected!${NC}\n\n"
    exit 0
fi

count=$(wc -l ./log/new-drives | cut -d ' ' -f 1)

printf "\n$count new drives detected:\n\n"

cat ./log/new-drives

printf "\n   ${RED}This will wipe all removable devices listed above!${NC}\n\n"

bloweraway="T"

while [[ $bloweraway != 'y' && $bloweraway != 'n' && $bloweraway != 'Y' && $bloweraway != 'N' ]]
do
    printf "Erase devices? (select ${WHT}*ON TOUCH*${NC} of ${GRN}'y'${NC} or ${RED}'n'${NC}) "
    read -n 1 -s -p "" bloweraway
    echo
done

if [[ "$bloweraway" == 'y' || "$bloweraway" == 'Y' ]]
then
    for drive in $(cat ./log/new-drives)
    do
        printf "\n${YLW}Wiping device:${WHT} $drive${NC}\n"
        dd if=/dev/zero of=$drive bs=1k count=1024
    done
    printf "\n   ${GRN}DONE${NC}\n\n"
    exit 0
else
    printf "\n\nCome back when you've got the guts then...\n\n"
    exit 0
fi

