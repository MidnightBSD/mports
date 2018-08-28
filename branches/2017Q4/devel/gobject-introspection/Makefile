# $MidnightBSD$

PORTNAME=	gobject-introspection
PORTVERSION=	1.44.0
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
LIB_DEPENDS=	libffi.so:${PORTSDIR}/devel/libffi

USES=		bison gettext gmake libtool pathfix pkgconfig \
		python:2 tar:xz
GNU_CONFIGURE=	yes
USE_GNOME=	glib20
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

# Force it to put the .cache in ${WRKSRC} instead of ~/.cache.
MAKE_ENV=	HOME=${WRKDIR}

post-patch:
	@${REINPLACE_CMD} -e 's|'gcc'|'cc'|g' \
		${WRKSRC}/giscanner/dumper.py

.include <bsd.port.mk>
