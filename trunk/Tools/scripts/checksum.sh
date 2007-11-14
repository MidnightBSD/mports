#!/bin/sh
#
# Created by:	Alexander Langer <alex@big.endian.de>
# Created on:	May 22, 2000
# MAINTAINER=	ports@MidnightBSD.org

if [ -z $1 ]; then
	echo "Usage: $0 <portname> ..."
	exit 1
fi

if [ -z $TMPDIR ]; then
	TMPDIR=/tmp
fi
if [ -z $PORTSDIR ]; then
	PORTSDIR=/usr/mports
fi

while [ ! -z $1 ]; do
	echo "Processing for $1..."

	cd $PORTSDIR
	DIR=`grep $1 INDEX| cut -f2 -d\|`
	cd $DIR

	make fetch
	broken=`make checksum 2>&1 | grep "Checksum mismatch for" | \
		awk '{print $5}' | sed -e 's:\.$::'`

	if [ -z $broken ]; then
		make checksum
		shift
		continue
	fi

	rm -rf $TMPDIR/checksum
	mkdir $TMPDIR/checksum
	cd $TMPDIR/checksum
	mkdir $TMPDIR/checksum/orig
	mkdir $TMPDIR/checksum/new

	echo Fetching $broken
	fetch ftp://ftp.MidnightBSD.ORG/pub/MidnightBSD/distfiles/$broken

	if [ ! -r $broken ]; then
		echo "File $broken not found, fetch error?"
		exit 1
	fi

	if file $broken | grep "gzip compressed data" >/dev/null; then
		cd orig
		tar -zxf ../$broken || gunzip -c ../$broken > ${broken%.gz}
		cd ../new
		tar -zxf $PORTSDIR/Distfiles/$broken || \
			gunzip -c $PORTSDIR/Distfiles/$broken > ${broken%.gz}
		cd ..
	elif file $broken | grep "compress'd data 16 bits" >/dev/null; then
		cd orig
		tar -zxf ../$broken
		cd ../new
		tar -zxf $PORTSDIR/Distfiles/$broken
		cd ..
	elif file $broken | grep "zip archive file" >/dev/null; then
		cd orig
		unzip ../$broken
		cd ../new
		unzip $PORTSDIR/Distfiles/$broken
		cd ..
	elif file $broken | grep "bzip compressed data" >/dev/null; then
		cd orig
		tar -yxf ../$broken
		cd ../new
		tar -yxf $PORTSDIR/Distfiles/$broken
		cd ..
	else
		cp $broken orig/
		cp $PORTSDIR/Distfiles/$broken new/
	fi

	echo Diff follows:
	diff -rNu orig new

	shift
done
