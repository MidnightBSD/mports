#!/bin/sh
#
# Copyright (c) 2006  The MidnightBSD Project
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#
# legal-packages.sh - D. Adam Karim
#
# This script goes through the built packages on a system and verifies that
# those packages do not violate any copyright or export laws. The script
# uses LEGAL in order to verify this. This script is by no means a panacea;
# as such, I cannot verify that all packages that are not in LEGAL are
# allowed to be distrubted or exported. This is only meant to be a tool to
# aid in the endeavor to fallow good legal practices. If any packages are
# found to be violating any laws, please email archite@midnightbsd.org and
# we will add it to our LEGAL file.
#
# $MidnightBSD: mports/Tools/scripts/legal-packages.sh,v 1.2 2007/03/13 17:47:03 archite Exp $
#

PORTS_DIR=/usr/mports
PKGS_DIR=/usr/mports/Packages

cd ${PKGS_DIR}/All
for PKG in *; do
	STRIP_PKG=`echo ${PKG} | sed 's/-[0-9].*//g'`
	ILLEGAL=`grep ^$STRIP_PKG ${PORTS_DIR}/LEGAL`
	if [ -n "${ILLEGAL}" ]; then
		echo "Removing ${STRIP_PKG}"
		find ${PKGS_DIR} -iname "*${STRIP_PKG}*" -execdir rm -rf {} \;
	fi
done
