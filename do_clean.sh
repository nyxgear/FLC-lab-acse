#!/bin/bash

echo -e '\ngit reset .'
git reset .

echo -e '\ngit checkout .'
git checkout .

echo -e '\ngit clean -fd'
git clean -fd

echo -e '\nDone.'

