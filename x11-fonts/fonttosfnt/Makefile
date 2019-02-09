# $FreeBSD: ports/x11-fonts/fonttosfnt/Makefile,v 1.1 2007/05/19 20:29:25 flz Exp $
# $MidnightBSD$

PORTNAME=	fonttosfnt
PORTVERSION=	1.0.5
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrap a bitmap font in a sftn wrapper

LICENSE=	mit

LIB_DEPENDS=	libfreetype.so:print/freetype2

XORG_CAT=	app
USE_XORG=	xorgproto fontenc

PLIST_FILES=	bin/fonttosfnt man/man1/fonttosfnt.1.gz

.include <bsd.port.mk>
