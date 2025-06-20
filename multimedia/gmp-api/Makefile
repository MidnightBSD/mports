PORTNAME=	gmp-api
DISTVERSION=	114_2
DISTVERSIONPREFIX=	Firefox
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gecko Media Plugins API from mozilla-release
WWW=		https://wiki.mozilla.org/GeckoMediaPlugins

LICENSE=	Apache-2.0

USE_GITHUB=	yes
GH_ACCOUNT=	mozilla

NO_BUILD=	yes
NO_ARCH=	yes

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/include/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/*.h ${STAGEDIR}${PREFIX}/include/${PORTNAME}

.include <bsd.port.mk>
