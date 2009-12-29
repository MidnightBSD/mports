# New ports collection makefile for:	libgnomekbd
# Date created:		2006-11-07
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/x11/libgnomekbd/Makefile,v 1.3 2009/09/20 01:51:41 smultron Exp $
# $FreeBSD: ports/x11/libgnomekbd/Makefile,v 1.7 2007/05/28 23:22:29 mezz Exp $
#    $MCom: ports/x11/libgnomekbd/Makefile,v 1.5 2007/03/12 01:37:17 mezz Exp $
#

PORTNAME=	libgnomekbd
PORTVERSION=	2.26.0
PORTREVISION=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME keyboard shared library
LICENSE=	lgpl

LIB_DEPENDS=	xklavier.12:${PORTSDIR}/x11/libxklavier \
		dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

USE_BZIP2=	yes
USE_GNOME=	gnomeprefix gnomehack ltverhack gconf2 libglade2
USE_AUTOTOOLS=	libtool:22
INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_GMAKE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	desktop_gnome_peripherals_keyboard_xkb.schemas

post-patch:
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e \
	    	's|-Werror||g'

.include <bsd.port.mk>
