# $MidnightBSD: mports/graphics/libchamplain/Makefile,v 1.1 2012/03/06 02:40:05 laffer1 Exp $

PORTNAME=	libchamplain
PORTVERSION=	0.8.1
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A C library aimed to provide a Gtk+ widget to display rasterized maps and markers

LICENSE=	lgpl

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
LIB_DEPENDS=	clutter-gtk-0.10:${PORTSDIR}/graphics/clutter-gtk \
		soup-gnome-2.4:${PORTSDIR}/devel/libsoup-gnome
RUN_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection

USE_BZIP2=	yes
USES=		pathfix pkgconfig
USE_GNOME=	gnomeprefix gtk20 ltverhack:1
USE_SQLITE=	3
USE_AUTOTOOLS=	libtool
USE_GL=		gl
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_SUB=	VERSION=0.8

.include <bsd.port.mk>
