if [ $# -eq 0 ] ; then
  echo 'Pass file destination for patch'
  exit 1
fi

git add .
git diff --staged > patches/$1
git reset .
git add patches/
git commit -m "New patch @ $1"
