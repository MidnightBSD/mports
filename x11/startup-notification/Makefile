# $MidnightBSD: mports/x11/startup-notification/Makefile,v 1.10 2011/05/28 06:23:34 laffer1 Exp $
# $FreeBSD: ports/x11/startup-notification/Makefile,v 1.20 2006/02/23 10:39:59 ade Exp $

PORTNAME=	startup-notification
PORTVERSION=	0.10
PORTREVISION=	2
CATEGORIES=	x11 gnome
MASTER_SITES=	http://www.freedesktop.org/software/startup-notification/releases/
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library that supports startup notification spec from freedesktop.org
LICENSE=	lgpl

LIB_DEPENDS=	xcb-aux.0:${PORTSDIR}/x11/xcb-util

USE_XORG=	x11
USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_GNOME=	gnomehack  pkgconfig ltasneededhack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS+=ac_cv_lib_ICE_IceConnectionNumber=no

.include <bsd.port.mk>
