# $MidnightBSD$

PORTNAME=	xcursor-themes
PORTVERSION=	1.0.5
PORTREVISION=	1
CATEGORIES=	x11-themes

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org cursors themes

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	xcursorgen:x11/xcursorgen

CONFIGURE_ARGS+=--with-cursordir=${PREFIX}/share/icons

USE_XORG=	xorgproto

XORG_CAT=	data

.include <bsd.port.mk>
