#! /bin/sh
# Do apply a patch file to the repository.

if [ $# -eq 0 ] ; then
  echo "Error: missing path to patch file to apply.\nUsage: $0 path/to/patch_to_apply.patch"
  exit 1
fi

patch --no-backup-if-mismatch -Np1 -i $1 
