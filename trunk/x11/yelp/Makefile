# New ports collection makefile for:	yelp
# Date created:				18 May 2002
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/x11/yelp/Makefile,v 1.6 2008/10/20 18:32:57 ctriv Exp $
# $FreeBSD: ports/x11/yelp/Makefile,v 1.57 2007/05/19 20:28:22 flz Exp $
#   $MCom: ports/x11/yelp/Makefile,v 1.110 2007/03/14 17:45:40 marcus Exp $
#

PORTNAME=	yelp
PORTVERSION=	2.22.1
PORTREVISION=	2
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A help browser for the GNOME 2 desktop
LICENSE=	gpl2

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
		rarian.0:${PORTSDIR}/textproc/rarian

USE_GECKO=	browser<->firefox xulrunner
USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_XORG=	ice
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack libgnomeui gnomedocutils
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-gecko=${GECKO}
MAKE_ENV=	G_CHARSET_ALIAS="${LOCALBASE}/libdata/charset.alias"

GCONF_SCHEMAS=	yelp.schemas

.include <bsd.port.mk>
