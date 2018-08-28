# $MidnightBSD$

PORTNAME=	xorg-fonts
PORTVERSION=	7.7
PORTREVISION=	1
CATEGORIES=	x11-fonts

MASTER_SITES=   #
DISTFILES=      #
EXTRACT_ONLY=   #
NO_BUILD=       yes

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org fonts meta-port
LICENSE=	agg

USE_XORG=	fontutil

RUN_DEPENDS=	xorg-fonts-100dpi>0:${PORTSDIR}/x11-fonts/xorg-fonts-100dpi \
		xorg-fonts-75dpi>0:${PORTSDIR}/x11-fonts/xorg-fonts-75dpi \
		xorg-fonts-cyrillic>0:${PORTSDIR}/x11-fonts/xorg-fonts-cyrillic \
		xorg-fonts-miscbitmaps>0:${PORTSDIR}/x11-fonts/xorg-fonts-miscbitmaps \
		xorg-fonts-truetype>0:${PORTSDIR}/x11-fonts/xorg-fonts-truetype \
		xorg-fonts-type1>0:${PORTSDIR}/x11-fonts/xorg-fonts-type1 \
		font-alias>0:${PORTSDIR}/x11-fonts/font-alias

do-install:
	@${MKDIR} ${PREFIX}/libdata/xorg
	@${TOUCH} ${PREFIX}/libdata/xorg/fonts

.include <bsd.port.mk>
