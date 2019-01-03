#! /bin/sh
make
touch tests/$1/$1.src
make tests
bin/mace tests/$1/$1.o
