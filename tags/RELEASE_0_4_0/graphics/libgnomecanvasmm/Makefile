# $MidnightBSD: mports/graphics/libgnomecanvasmm/Makefile,v 1.5 2011/02/02 21:04:18 laffer1 Exp $

PORTNAME=	libgnomecanvasmm
PORTVERSION=	2.0.1
PORTREVISION=	2
CATEGORIES=	graphics gnome
MASTER_SITES=	SF/gtkmm/OldFiles
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for libgnomecanvas library
LICENSE=	lgpl

LIB_DEPENDS=	gtkmm-2.0:${PORTSDIR}/x11-toolkits/gtkmm20
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_GMAKE=	yes
USE_GNOME=	gnomehack libgnomecanvas
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/examples//' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
