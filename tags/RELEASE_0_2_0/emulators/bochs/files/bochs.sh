#!/bin/sh
#
# $FreeBSD: ports/emulators/bochs/files/bochs.sh,v 1.1 2001/10/20 09:48:57 kevlo Exp $
#
# Bochs wrapper
#

bin_dir=%%PREFIX%%/libexec
xbin_dir=%%X11BASE%%/bin
font_dir=%%FONT_DIR%%

${xbin_dir}/xset -q | grep -q ${font_dir}
rc=$?

if [ $rc != 0 ]; then
	${xbin_dir}/xset fp+ ${font_dir}
	${xbin_dir}/xset fp rehash
fi

${bin_dir}/bochs.bin ${1+"$@"}

if [ $rc != 0 ]; then
	${xbin_dir}/xset fp- ${font_dir}
	${xbin_dir}/xset fp rehash
fi
