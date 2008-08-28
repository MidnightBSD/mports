# ex:ts=8
# Ports collection makefile for:  raidtest
# Date created:			  Sat Oct 16, 2004
# Whom:				  David O'Brien (obrien@FreeBSD.org)
#
# $MidnightBSD$
# $FreeBSD: ports/benchmarks/raidtest/Makefile,v 1.6 2007/05/02 07:17:21 edwin Exp $
#

PORTNAME=	raidtest
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	benchmarks
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test performance of storage devices
LICENSE=	bsd2

FAKE_OPTS=	trueprefix

NO_WRKSUBDIR=	yes
PLIST_FILES=	bin/raidtest

do-fetch:

do-extract:
	${MKDIR} ${WRKDIR}
	${LN} -sf ${FILESDIR}/${PORTNAME}.c ${FILESDIR}/Makefile ${WRKDIR}

.include <bsd.port.mk>
