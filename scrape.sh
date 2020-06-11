#!/usr/bin/env bash

# Select target Folder to scrape
SE_DIR="$(pwd)/$1/"

# Ask User for file destination
read -p "Enter Save File Name: " CURR_FILE

read -p "Enter Folders to exclude: " -a FOLDER

read -p "Enter Files Extension to exclude: " -a EXT_EXC

# Directories to avoid added to the find command
AVOID_DIR=""
for FOL in "${FOLDER[@]}";
do
   AVOID_DIR="$AVOID_DIR-not -path \"*/$FOL/*\" "
done

AVOID_FILES=""
for FIL in "${EXT_EXC[@]}";
do
    AVOID_FILES="$AVOID_FILES-not -path \"*/*.$FIL\" "
done

# After the find query has been constructed it is then evaled and saved in the desired file
ALL_FILES="find ${SE_DIR} -type f ${AVOID_DIR} ${AVOID_FILES} -exec cat '{}' >> "$CURR_FILE" \;"
eval "$ALL_FILES"
exit 0


