#!/bin/sh
#
# $MidnightBSD$
#

# A pre-commit hook to detect files with no newline at end of file
#

REPO=$1
TXN=$2

SVNLOOK=/usr/local/bin/svnlook

# Check arguments
if [ -z "$REPO" -o -z "$TXN" ]; then
  echo "Syntax: $0 path_to_repos txn_id" >&2
  exit 1
fi

# We scan through the transaction diff, looking for
# 'No newline at end of file' message. If we find one,
# we abort the commit.
SUSPICIOUS=$($SVNLOOK diff -t "$TXN" "$REPO" | \
	grep '^\\ No newline at end of file' | wc -l)

if [ $SUSPICIOUS -ne 0 ]; then
  echo "Some files in your commit does not have newline at end" >&2
  echo "of file. Please fix this and try committing again." >&2
  exit 1
fi

# No files without newlines at last line detected, let it fly!
exit 0
