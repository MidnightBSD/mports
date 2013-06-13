# $MidnightBSD: mports/x11/xcursorgen/Makefile,v 1.7 2012/09/09 01:15:54 laffer1 Exp $

PORTNAME=	xcursorgen
PORTVERSION=	1.0.5
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create an X cursor file from a collection of PNG images
LICENSE=	mit

LIB_DEPENDS=	png15:${PORTSDIR}/graphics/png

XORG_CAT=	app
USE_XORG=	x11 xcursor xextproto

PLIST_FILES=	bin/xcursorgen

MAN1=		xcursorgen.1

.include <bsd.port.mk>
