# $MidnightBSD$

PORTNAME=	libXt
PORTVERSION=	1.1.4
PORTREVISION=	2
CATEGORIES=	x11-toolkits

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Toolkit library

LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	x11 sm xproto:both kbproto
CONFIGURE_ARGS=	--disable-specs

post-patch:
	@${REINPLACE_CMD} 's/test.*-traditional.*;/true;/' \
		${WRKSRC}/configure

.include <bsd.port.mk>
