# New ports collection makefile for:	startup-notification
# Date created:				14 November 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11/startup-notification/Makefile,v 1.7 2010/01/19 02:50:52 laffer1 Exp $
# $FreeBSD: ports/x11/startup-notification/Makefile,v 1.20 2006/02/23 10:39:59 ade Exp $
#

PORTNAME=	startup-notification
PORTVERSION=	0.10
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
USE_GNOME=	gnomehack gnometarget pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
