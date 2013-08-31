#! /bin/sh
# check out/update SVN control files if needed
REV="$2"
REPO="$1"
if svnlook -r $REV dirs-changed $REPO | grep '^svnadmin/hooks/' > /dev/null
then
  echo "Updating repository control files." 1>&2
  cd $REPO/hooks
  output=`svn up --accept theirs-full 2>&1`
  if [ $? != 0 ]; then
    echo "svn update of hooks config files failed: $output, $!" 1>&2
  fi
fi

if svnlook -r $REV dirs-changed $REPO | grep '^svnadmin/conf/' > /dev/null
then
  cd $REPO/conf
  output=`svn up --accept theirs-full 2>&1`
  if [ $? != 0 ]; then
    echo "svn update of conf config files failed: $output, $!" 1>&2
  fi
fi 
