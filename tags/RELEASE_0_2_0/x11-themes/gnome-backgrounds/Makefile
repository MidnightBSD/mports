# New ports collection makefile for:	gnome-backgrounds
# Date Created:				12 January 2005
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11-themes/gnome-backgrounds/Makefile,v 1.17 2007/10/24 23:37:12 marcus Exp $
#   $MCom: ports/x11-themes/gnome-backgrounds/Makefile,v 1.31 2007/09/18 16:40:37 mezz Exp $
#

PORTNAME=	gnome-backgrounds
PORTVERSION=	2.20.0
CATEGORIES=	x11-themes graphics gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A collection of backgrounds for GNOME 2
LICENSE=	unknown

USE_BZIP2=	yes
USE_XLIB=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnometarget gnomehack intlhack
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
	       	LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
