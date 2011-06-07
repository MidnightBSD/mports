# $MidnightBSD$
# $FreeBSD: ports/devel/dconf/Makefile,v 1.4 2010/12/19 18:06:50 mandree Exp $

PORTNAME=	dconf
PORTVERSION=	0.5.1
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A configuration database system for GNOME
LICENSE=	lgpl

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection \
		valac:${PORTSDIR}/lang/vala
LIB_DEPENDS=	gee.2:${PORTSDIR}/devel/libgee

USE_BZIP2=	yes
USE_GMAKE=	yes
#USE_GETTEXT=	yes
USE_GNOME=	gnomehack gtk20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

MAKE_JOBS_SAFE=	yes

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

pre-build:
	${GMAKE} -C ${WRKSRC}/client dconf-client.c libdconf.so.0

post-install:
	-${LOCALBASE}/bin/gio-querymodules ${PREFIX}/lib/gio/modules

.include <bsd.port.mk>
