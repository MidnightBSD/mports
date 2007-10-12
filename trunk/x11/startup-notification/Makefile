# New ports collection makefile for:	startup-notification
# Date created:				14 November 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11/startup-notification/Makefile,v 1.2 2007/03/25 02:47:14 ctriv Exp $
# $FreeBSD: ports/x11/startup-notification/Makefile,v 1.20 2006/02/23 10:39:59 ade Exp $
#

PORTNAME=	startup-notification
PORTVERSION=	0.8
PORTREVISION=	3
CATEGORIES=	x11 gnome
MASTER_SITES=	${MASTER_SITE_GNOME} \
		http://www.freedesktop.org/software/startup-notification/releases/
MASTER_SITE_SUBDIR=	sources/startup-notification/0.8
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library that supports startup notification spec from freedesktop.org

USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
