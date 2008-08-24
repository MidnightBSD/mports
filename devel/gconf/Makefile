# New ports collection makefile for:	gconf
# Date created:				28th June 2000
# Whom:					Ade Lovett <ade@FreeBSD.org>
#
# $MidnightBSD: mports/devel/gconf/Makefile,v 1.2 2008/03/31 01:33:53 laffer1 Exp $
# $FreeBSD: ports/devel/gconf/Makefile,v 1.50 2007/05/19 20:02:32 flz Exp $
#

PORTNAME=	gconf
PORTVERSION=	1.0.9
PORTREVISION=	12
CATEGORIES=	devel gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/GConf/1.0
DISTNAME=	GConf-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A configuration database system for GNOME

LIB_DEPENDS=	guile.19:${PORTSDIR}/lang/guile

USE_AUTOTOOLS=	libtool:15
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XLIB=	yes
USE_GNOME=	gnomeprefix gnomehack gnometarget glib12 gtk12 oaf libxml orbit
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
