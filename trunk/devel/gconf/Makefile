# $MidnightBSD: mports/devel/gconf/Makefile,v 1.7 2011/02/02 20:17:32 laffer1 Exp $

PORTNAME=	gconf
PORTVERSION=	1.0.9
PORTREVISION=	14
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/GConf/1.0
DISTNAME=	GConf-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A configuration database system for GNOME
LICENSE=	lgpl

LIB_DEPENDS=	guile.20:${PORTSDIR}/lang/guile

MAKE_JOBS_UNSAFE=yes

USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XLIB=	yes
USE_GNOME=	gnomeprefix gnomehack glib12 gtk12 oaf libxml orbit
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
