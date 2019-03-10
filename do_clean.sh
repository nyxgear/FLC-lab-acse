#!/bin/bash
# Remove all the performed changes in the whole repository.

echo -e '------> git reset .'
git reset .

echo -e '------> git checkout .'
git checkout .

echo -e '------> git clean -fd'
git clean -fd

echo -e '\nDone.'

