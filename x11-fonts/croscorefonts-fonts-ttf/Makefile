# Created by: Pedro Giffuni

PORTNAME=	croscorefonts
PORTVERSION=	1.31.0
CATEGORIES=	x11-fonts
MASTER_SITES=	https://gsdview.appspot.com/chromeos-localmirror/distfiles/ \
		https://commondatastorage.googleapis.com/chromeos-localmirror/distfiles \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fonts created from by Google for ChromeOS to replace MS TTF

LICENSE=	Apache-2.0

USES=		fonts tar:bzip2 xorg
USE_XORG=	x11

NO_ARCH=	yes
NO_BUILD=	yes

SUB_FILES=	pkg-message

FONTNAME=	ChromeOS

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}/
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}/

.include <bsd.port.mk>
