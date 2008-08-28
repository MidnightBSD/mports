# New ports collection makefile for:   subversion-python
# Date Created:                Nov 14 2007
# Whom:                        Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PKGNAMESUFFIX=	-python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Version control system with Python bindings
LICENSE=	agg
# this depends on a slew of software and it's effectively a slave port

MASTERDIR=	${.CURDIR}/../../devel/subversion
PKGDIR=		${.CURDIR}
PLIST=		${MASTERDIR}/pkg-plist

WITH_PYTHON=	yes

.include "${MASTERDIR}/Makefile"
