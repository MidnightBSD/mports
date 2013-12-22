# $MidnightBSD$

PORTNAME=	mkfontscale
PORTVERSION=	1.1.1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Creates an index of scalable font files for X

LICENSE=	mit

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2

XORG_CAT=	app
USE_XORG=	xproto fontenc

MAN1=		mkfontscale.1
CONFIGURE_ARGS+=--disable-maintainer-mode

.include <bsd.port.mk>
