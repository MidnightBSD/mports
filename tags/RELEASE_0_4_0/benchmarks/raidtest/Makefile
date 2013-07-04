# $MidnightBSD: mports/benchmarks/raidtest/Makefile,v 1.2 2007/10/25 00:43:57 laffer1 Exp $

PORTNAME=	raidtest
PORTVERSION=	1.2
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
