# $MidnightBSD$
# $FreeBSD: head/multimedia/gmp-api/Makefile 392273 2015-07-16 06:05:59Z jbeich $

PORTNAME=	gmp-api
DISTVERSIONPREFIX=	Firefox
DISTVERSION=	39 # tracking www/firefox
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gecko Media Plugins API from mozilla-release

LICENSE=	apache2

USE_GITHUB=	yes
GH_ACCOUNT=	mozilla

WRKSRC=		${WRKDIR}/gmp-api-Firefox39

NO_BUILD=	yes
NO_ARCH=	yes

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/include/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/*.h ${STAGEDIR}${PREFIX}/include/${PORTNAME}

.include <bsd.port.mk>
