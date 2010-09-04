# New ports collection makefile for:	gnome-backgrounds
# Date Created:				12 January 2005
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11-themes/gnome-backgrounds/Makefile,v 1.4 2009/12/13 19:09:16 laffer1 Exp $
# $FreeBSD: ports/x11-themes/gnome-backgrounds/Makefile,v 1.17 2007/10/24 23:37:12 marcus Exp $
#   $MCom: ports/x11-themes/gnome-backgrounds/Makefile,v 1.31 2007/09/18 16:40:37 mezz Exp $
#

PORTNAME=	gnome-backgrounds
PORTVERSION=	2.30.0
CATEGORIES=	x11-themes graphics gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A collection of backgrounds for GNOME 2
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
	       	LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
