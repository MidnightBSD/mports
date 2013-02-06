# $MidnightBSD: mports/Mk/bsd.port.mk,v 1.20 2007/08/07 19:57:41 ctriv Exp $

#
# This file is a workaround for a bug in the 0.1 release.  /usr/share/mk/bsd.port.mk
# included this file instead of bsd.mport.mk.
#

BSDMPORTMK?=	${PORTSDIR}/Mk/bsd.mport.mk

.include "${BSDMPORTMK}"
