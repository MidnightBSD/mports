# $MidnightBSD: mports/graphics/libsvg/Makefile,v 1.4 2011/02/02 21:04:18 laffer1 Exp $

PORTNAME=	libsvg
PORTVERSION=	0.1.4
PORTREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	http://cairographics.org/snapshots/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A parser for SVG content in files or buffers
LICENSE=	lgpl

LIB_DEPENDS=	fontconfig.1:${PORTSDIR}/x11-fonts/fontconfig \
		png.6:${PORTSDIR}/graphics/png \
		jpeg.11:${PORTSDIR}/graphics/jpeg

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_GNOME=	libxml2 gnomehack
USE_ICONV=	yes
USE_LDCONFIG=	yes

PLIST_FILES=	include/svg.h \
		lib/libsvg.a \
		lib/libsvg.la \
		lib/libsvg.so \
		lib/libsvg.so.1 \
		libdata/pkgconfig/libsvg.pc

.include <bsd.port.mk>
