# $MidnightBSD: mports/x11/startup-notification/Makefile,v 1.12 2012/03/03 01:52:54 laffer1 Exp $

PORTNAME=	startup-notification
PORTVERSION=	0.12
CATEGORIES=	x11 gnome
MASTER_SITES=	http://www.freedesktop.org/software/startup-notification/releases/
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library that supports startup notification spec from freedesktop.org
LICENSE=	lgpl

LIB_DEPENDS=	xcb-util:${PORTSDIR}/x11/xcb-util

USE_XORG=	x11
USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_PKGCONFIG=	build
USE_GNOME=	gnomehack ltasneededhack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS+=ac_cv_lib_ICE_IceConnectionNumber=no

.include <bsd.port.mk>
