PORTNAME=	agave
PORTVERSION=	37
DISTVERSIONPREFIX=	v
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TrueType monospaced font designed for X environments
WWW=		https://b.agaric.net/page/agave

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/../LICENSE

BUILD_DEPENDS=	fontforge:print/fontforge \
		ttfautohint:print/ttfautohint

USES=		cpe fonts
CPE_VENDOR=	anomali
USE_GITHUB=	yes
GH_ACCOUNT=	blobject
NO_ARCH=	yes

WRKSRC_SUBDIR=	src

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
