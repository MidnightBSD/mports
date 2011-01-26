#!/bin/sh
# $FreeBSD: ports/Tools/scripts/release/setup.sh,v 1.3 2002/05/16 03:24:44 will Exp $

dir=$@
if [ -z $dir ]; then
	echo "Usage: $0 <path to dir with ports and packages to split>"
	exit 1
fi
if [ ! -d $dir ]; then
	echo "Directory not found.  Aborting."
	exit 1
fi

tar xzvf $dir/ports.tar.gz
cd ports
rm -f distfiles packages
mkdir distfiles packages
(echo "copying packages ..." && cd packages && cp -R $dir/packages/ .)
#(echo "copying distfiles ..." && cd distfiles && cp -R $dir/distfiles/ .)
