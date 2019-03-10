#!/bin/bash
# Create a new patch file and commit it.

if [ $# -eq 0 ] ; then
  echo "Error: missing file destination for patch.\nUsage: $0 path/to/patch_to_create.patch"
  exit 1
fi

git add .
git diff --staged > $1
git reset .
git add patches/
git commit -m "New patch @ $1"
