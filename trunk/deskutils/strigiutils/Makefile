# $MidnightBSD$

PORTNAME=	strigiutils
PORTVERSION=	${STRIGI_VERSION}
CATEGORIES=	deskutils
MASTER_SITES=	${STRIGI_MASTER_SITES}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Strigi desktop search: utilities

LICENSE=	gpl2

LIB_DEPENDS=	streams:${PORTSDIR}/deskutils/libstreams \
		streamanalyzer:${PORTSDIR}/deskutils/libstreamanalyzer

MAKE_JOBS_SAFE=	yes

.include <${.CURDIR}/../strigi/Makefile.common>
.include <bsd.port.mk>
