# New ports collection makefile for:	gnometerminal
# Date created:				1 May 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11/gnome-terminal/Makefile,v 1.2 2007/10/20 05:29:54 laffer1 Exp $
# $FreeBSD: ports/x11/gnome-terminal/Makefile,v 1.43 2007/06/23 16:44:57 mezz Exp $
#   $MCom: ports/x11/gnome-terminal/Makefile,v 1.86 2007/03/13 00:46:19 mezz Exp $
#

PORTNAME=	gnome-terminal
PORTVERSION=	2.18.4
CATEGORIES=	x11 gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal component for the GNOME 2 Desktop
LICENSE=	gpl2

USE_GETTEXT=	yes
USE_BZIP2=	yes
INSTALLS_OMF=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack libgnomeui vte gnomedocutils
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gnome-terminal.schemas

.include <bsd.port.mk>
