#!/bin/bash

echo -e '------> git add .'
git add .


if [ -z "$1" ]; then
	echo -e '------> git stash'
	git stash
else
	echo -e "------> git stash save ""$1"
	git stash save "$1"
fi

echo -e '\nDone.'

