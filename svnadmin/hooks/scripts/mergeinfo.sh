#!/bin/sh
#
# $MidnightBSD$
# http://svn.collab.net/repos/svn/trunk/contrib/hook-scripts/detect-merge-conflicts.sh

# A pre-commit hook to check that mergeinfo is only
# allowed on certain directories.
#

REPO=$1
TXN=$2

SVNLOOK=/usr/local/bin/svnlook

# Check arguments
if [ -z "$REPO" -o -z "$TXN" ]; then
  echo "Syntax: $0 path_to_repos txn_id" >&2
  exit 1
fi

# We scan through the changed directories and looking for mergeinfo
PATH=$($SVNLOOK dirs-changed -t $TXN $REPO)
for path in $PATH
do 
  if $SVNLOOK proplist -t $TXN $REPO ${path} | /usr/bin/grep svn:mergeinfo
  then
    if echo ${path} | /usr/bin/egrep -q -v '^branches/[A-Z0-9_]*/$|^tags/[A-Z0-9_]*/$'
    then 
      echo "It seems that the mergeinfo is at the wrong place." >&2
      echo "Please double-check your commit and try committing again." >&2
      exit 1
    fi
  fi 
done

# No wrong mergeinfo detected, let it fly!
exit 0
