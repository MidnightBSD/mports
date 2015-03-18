# $MidnightBSD$

PORTNAME=	gconf
PORTVERSION=	1.0.9
PORTREVISION=	16
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/GConf/1.0
DISTNAME=	GConf-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configuration database system for GNOME

LICENSE=	lgpl

LIB_DEPENDS=	libguile.so:${PORTSDIR}/lang/guile

MAKE_JOBS_UNSAFE=yes

USES=		tar:bzip2 gettext gmake libtool
USE_XLIB=	yes
USE_GNOME=	glib12 gtk12 oaf libxml orbit
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS="-I${LOCALBASE}/include"
LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
