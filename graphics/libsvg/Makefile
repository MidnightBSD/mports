# $MidnightBSD$

PORTNAME=	libsvg
PORTVERSION=	0.1.4
CATEGORIES=	graphics
MASTER_SITES=	http://cairographics.org/snapshots/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A parser for SVG content in files or buffers
LICENSE=	lgpl

LIB_DEPENDS=	fontconfig.1:${PORTSDIR}/x11-fonts/fontconfig \
		png.5:${PORTSDIR}/graphics/png \
		jpeg.10:${PORTSDIR}/graphics/jpeg

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_GNOME=	libxml2 gnomehack gnometarget
USE_ICONV=	yes
USE_LDCONFIG=	yes

PLIST_FILES=	include/svg.h \
		lib/libsvg.a \
		lib/libsvg.la \
		lib/libsvg.so \
		lib/libsvg.so.1 \
		libdata/pkgconfig/libsvg.pc

.include <bsd.port.mk>
