# New ports collection makefile for:	gnome-jabber
# Date created:				7 Nov 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/net-im/gnome-jabber/Makefile,v 1.1 2007/11/08 03:08:48 laffer1 Exp $
#

PORTNAME=	gnome-jabber
PORTVERSION=	0.4
PORTREVISION=	1
CATEGORIES=	net-im gnome
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 Jabber Client

LIB_DEPENDS=	gnet-2.0.0:${PORTSDIR}/net/gnet2

USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack libgnomeui
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gnome-jabber.schemas

.include <bsd.port.mk>
