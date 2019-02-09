# $MidnightBSD$

PORTNAME=	libfontenc
PORTVERSION=	1.1.3
PORTREVISION=	1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The fontenc Library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

XORG_CAT=	lib
USE_XORG=	xorgproto

CONFIGURE_ARGS=	--with-encodingsdir=${LOCALBASE}/share/fonts/encodings

.include <bsd.port.mk>
