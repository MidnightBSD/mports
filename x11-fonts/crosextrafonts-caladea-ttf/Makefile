PORTNAME=	crosextrafonts
PORTVERSION=	20130214
CATEGORIES=	x11-fonts
MASTER_SITES=	https://gsdview.appspot.com/chromeos-localmirror/distfiles/ \
		https://commondatastorage.googleapis.com/chromeos-localmirror/distfiles
PKGNAMESUFFIX=	-caladea

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Font created by Google for ChromeOS to replace MS Cambria
WWW=		https://code.google.com/p/chromium/issues/detail?id=168879

LICENSE=	Apache-2.0

USES=		fonts xorg
USE_XORG=	x11

NO_ARCH=	yes
NO_BUILD=	yes

SUB_FILES=	pkg-message

FONTNAME=	Caladea

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
