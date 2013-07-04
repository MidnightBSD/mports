# New ports collection makefile for:	amcl
# Date created:				15 Apr 2000
# Whom:					will
#
# $MidnightBSD: mports/net/gnome-mud/Makefile,v 1.2 2011/12/15 00:57:52 laffer1 Exp $
# $FreeBSD: ports/net/gnome-mud/Makefile,v 1.33 2008/03/25 22:44:42 miwi Exp $
#

PORTNAME=	gnome-mud
PORTVERSION=	0.11.2
PORTREVISION=	3
CATEGORIES=	net gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK-based MUD client with triggers, aliases, colors, etc
LICENSE=	gpl2

LIB_DEPENDS=	pcre.3:${PORTSDIR}/devel/pcre \
		gnet-2.0.0:${PORTSDIR}/net/gnet2

USE_BZIP2=	yes
USES=        pathfix
USE_GNOME=	gconf2 gnomeprefix intlhack libglade2 vte
USE_GSTREAMER=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALLS_ICONS=	yes

MAN6=		gnome-mud.6
GCONF_SCHEMAS=	gnome-mud.schemas

.include <bsd.port.mk>
