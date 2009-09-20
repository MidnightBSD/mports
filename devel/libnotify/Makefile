# New ports collection makefile for:	libnotify
# Date created:				2005-08-06
# Whom:					Andreas Kohn <andreas@syndrom23.de>
#
# $MidnightBSD: mports/devel/libnotify/Makefile,v 1.1 2007/10/23 21:01:20 laffer1 Exp $
# $FreeBSD: ports/devel/libnotify/Makefile,v 1.19 2007/05/19 20:03:08 flz Exp $
#

PORTNAME=	libnotify
PORTVERSION=	0.4.4
PORTREVISION=	1
CATEGORIES=	devel gnome
MASTER_SITES=	http://www.galago-project.org/files/releases/source/libnotify/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for desktop notifications
LICENSE=	lgpl

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

USE_GNOME=	gnomehack gnometarget intlhack glib20 gtk20 ltverhack
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ARGS= --without-gtk-doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
