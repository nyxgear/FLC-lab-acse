#! /bin/sh
if [ $# -eq 0 ] ; then
  echo "Error: missing path to test to run.\nUsage: $0 path/to/test.src"
  exit 1
fi

make
touch tests/$1/$1.src
make tests
bin/mace tests/$1/$1.o
