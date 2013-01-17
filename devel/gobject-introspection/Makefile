# $MidnightBSD: mports/devel/gobject-introspection/Makefile,v 1.7 2012/09/09 01:06:22 laffer1 Exp $

PORTNAME=	gobject-introspection
PORTVERSION=	0.10.8
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate interface introspection data for GObject libraries
LICENSE=	gpl2
# well it could be agg, but gpl2 is worst case

LIB_DEPENDS=	ffi.5:${PORTSDIR}/devel/libffi \
		cairo.2:${PORTSDIR}/graphics/cairo

USE_BZIP2=	yes
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


post-patch:
	@${REINPLACE_CMD} -e "s|'cc'|'${CC:Q:C/[[:space:]]+/', '/g}'|g" \
		${WRKSRC}/giscanner/sourcescanner.py

.include <bsd.port.mk>
