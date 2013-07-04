# $MidnightBSD: mports/devel/gobject-introspection/Makefile,v 1.9 2013/02/24 15:24:18 laffer1 Exp $

PORTNAME=	gobject-introspection
PORTVERSION=	1.34.2
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate interface introspection data for GObject libraries
LICENSE=	gpl2
# well it could be agg, but gpl2 is worst case

# we need cairo otherwise the generated Cairo gir is broken
BUILD_DEPENDS=	cairo-trace:${PORTSDIR}/graphics/cairo
LIB_DEPENDS=	ffi:${PORTSDIR}/devel/libffi

USE_XZ=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack glib20 ltverhack
USE_PYTHON=	-2.7
USE_BISON=	build
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
MAKE_JOBS_UNSAFE=yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-tests

# Force it to put the .cache in ${WRKSRC} instead of ~/.cache.
MAKE_ENV=	HOME=${WRKDIR}

MAN1=		g-ir-compiler.1 g-ir-generate.1 g-ir-scanner.1

.include <bsd.port.mk>
