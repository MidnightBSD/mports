# $MidnightBSD$

PORTNAME=	strigiutils
PORTVERSION=	${STRIGI_VERSION}
CATEGORIES=	deskutils
MASTER_SITES=	${STRIGI_MASTER_SITES}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Strigi desktop search: utilities

LICENSE=	gpl2

LIB_DEPENDS=	libstreams.so:${PORTSDIR}/deskutils/libstreams \
		libstreamanalyzers.so:${PORTSDIR}/deskutils/libstreamanalyzer

.include <${.CURDIR}/../strigi/Makefile.common>
.include <bsd.port.mk>
