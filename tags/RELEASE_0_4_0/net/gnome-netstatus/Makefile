# New ports collection makefile for:   gnomenetstatus
# Date Created:			05 December 2003
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/net/gnome-netstatus/Makefile,v 1.1 2008/05/31 00:41:57 laffer1 Exp $
# $FreeBSD: ports/net/gnome-netstatus/Makefile,v 1.30 2008/04/23 18:22:48 cokane Exp $
#   $MCom: ports/net/gnome-netstatus/Makefile,v 1.48 2007/07/04 21:42:20 marcus Exp $
#

PORTNAME=	gnome-netstatus
PORTVERSION=	2.28.2
PORTREVISION=	1
CATEGORIES=	net gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNOME applet that shows network status
LICENSE=	gpl2

INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GNOME=	gnomehack intlhack gnomeprefix libgnome gnomepanel \
		gnomedocutils
USE_GMAKE=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	netstatus.schemas

.include <bsd.port.mk>
