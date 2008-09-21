# New ports collection makefile for:	gnometerminal
# Date created:				1 May 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11/gnome-terminal/Makefile,v 1.4 2008/06/01 19:53:59 laffer1 Exp $
# $FreeBSD: ports/x11/gnome-terminal/Makefile,v 1.43 2007/06/23 16:44:57 mezz Exp $
#   $MCom: ports/x11/gnome-terminal/Makefile,v 1.86 2007/03/13 00:46:19 mezz Exp $
#

PORTNAME=	gnome-terminal
PORTVERSION=	2.22.3
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal component for the GNOME 2 Desktop
LICENSE=	gpl2

USE_GETTEXT=	yes
USE_BZIP2=	yes
INSTALLS_OMF=	yes
USE_XORG=	x11
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack libgnomeui vte gnomedocutils
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gnome-terminal.schemas

.include <bsd.port.mk>
