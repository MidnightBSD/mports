# $MidnightBSD: mports/x11/libgnomemm/Makefile,v 1.6 2011/05/28 06:23:34 laffer1 Exp $

PORTNAME=	libgnomemm
PORTVERSION=	2.0.1
PORTREVISION=	3
CATEGORIES=	x11 gnome
MASTER_SITES=	SF/gtkmm/OldFiles
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for libgnome library
LICENSE=	lgpl

LIB_DEPENDS=	gtkmm-2.0:${PORTSDIR}/x11-toolkits/gtkmm20
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_GNOME=	gnomehack libgnome
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static

.include <bsd.port.mk>
