#!/bin/sh
#
# $MidnightBSD$
# http://svn.collab.net/repos/svn/trunk/contrib/hook-scripts/detect-merge-conflicts.sh

# A pre-commit hook to detect forbidden files like core files,
# patch leftovers, CVS, Subversion or git directories.
#

REPO=$1
TXN=$2

SVNLOOK=/usr/local/bin/svnlook

# Check arguments
if [ -z "$REPO" -o -z "$TXN" ]; then
  echo "Syntax: $0 path_to_repos txn_id" >&2
  exit 1
fi

# We scan through the changed files, looking for forbidden files
PATH=$($SVNLOOK changed -t $TXN $REPO | /usr/bin/awk '{print $2}') 
for path in $PATH
do 
  file=`/usr/bin/basename ${path} | /usr/bin/sed -e 's,/$,,'`
  if echo ${file} | /usr/bin/egrep '^CVS$|^\.svn$|^\.git$' || echo ${file} | \
	/usr/bin/egrep '\.orig$' || echo ${file} | \
	/usr/bin/egrep -v '^patch-' | /usr/bin/egrep '\.core$'
  then 
    echo "Some files in your commit look suspiciously like core files," >&2
    echo "patch leftovers, CVS, Subversion or git directories. Please" >&2
    echo "double-check your commit and try committing again." >&2
    exit 1
  fi 
done

# No forbidden files detected, let it fly!
exit 0
