# $MidnightBSD$

PORTNAME=	raidtest
PORTVERSION=	1.3
CATEGORIES=	benchmarks
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test performance of storage devices

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

PLIST_FILES=	bin/raidtest

do-fetch:

do-extract:
	${MKDIR} ${WRKSRC}
	${LN} -sf ${FILESDIR}/${PORTNAME}.c ${FILESDIR}/Makefile ${WRKSRC}

.include <bsd.port.mk>
