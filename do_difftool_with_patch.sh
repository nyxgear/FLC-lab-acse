#!/bin/bash

# GOAL: perform diff with the git difftool command with the professor's solution.
#
# 1. Stash local current changes  [0]
# 2. Apply professor's patch
# 3. Stash professor's changes [1]
# 4. Restore stashed changes [0]
# 5. Perform git difftool -d <local_changes> <prof_patch_stashed>


if [ $1 -eq '']; then
	echo -e "ERROR: Patch path not passed as argument!\nUsage:\n\t" $0 "<path_to_patch>"
	exit -1
fi

# 1. Stash local changes
echo "------> 1. Stash local current changes"
./do_stash.sh "local_changes"


# 2. Apply professor's patch
echo "------> 2. Apply professor's patch"
patch --no-backup-if-mismatch -Np1 -i "$1"


# 3. Stash professor's changes
echo "------> 3. Stash professor's changes"
./do_stash.sh "prof_patch"


# 4. Restore stashed changes 
echo "------> 4. Restore previously stashed local changes"
git stash pop stash@{1}

# 5. Perform git difftool -d <local_changes> <prof_patch_stashed>
echo "------> 5. Perform git difftool -d <local_changes> <prof_patch_stashed>"
git add .
git difftool -d stash@{0}

