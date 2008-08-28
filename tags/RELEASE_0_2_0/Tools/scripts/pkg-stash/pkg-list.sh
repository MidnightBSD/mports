#!/bin/sh
# $FreeBSD: ports/Tools/scripts/pkg-stash/pkg-list.sh,v 1.1 2003/01/08 15:40:08 roam Exp $

for i in . `make all-depends-list`; do
	cd $i && [ -f "`make -V PKGFILE`" ] && make -V PKGFILE
done
