# New ports collection makefile for:	libnotify
# Date created:				2005-08-06
# Whom:					Andreas Kohn <andreas@syndrom23.de>
#
# $MidnightBSD: mports/devel/libnotify/Makefile,v 1.5 2011/12/15 00:34:42 laffer1 Exp $
# $FreeBSD: ports/devel/libnotify/Makefile,v 1.19 2007/05/19 20:03:08 flz Exp $
#

PORTNAME=	libnotify
PORTVERSION=	0.7.3
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for desktop notifications
LICENSE=	lgpl

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
RUN_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection

USE_BZIP2=	yes
USE_GNOME=	gnomehack intlhack glib20 gtk20 ltverhack
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
