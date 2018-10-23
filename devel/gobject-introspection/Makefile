# $MidnightBSD$

PORTNAME=	gobject-introspection
PORTVERSION=	1.56.1
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate interface introspection data for GObject libraries

LICENSE=	gpl2 lgpl
LICENSE_COMB=	multi

# we need cairo otherwise the generated Cairo gir is broken
BUILD_DEPENDS=	cairo-trace:graphics/cairo \
		python2.7:lang/python27
LIB_DEPENDS=	libffi.so:devel/libffi
RUN_DEPENDS=	python2.7:lang/python27

USES=		bison gettext gmake gnome libtool pathfix pkgconfig \
		python:3.4+ tar:xz
GNU_CONFIGURE=	yes
USE_GNOME=	glib20
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-doctool
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

# Force it to put the .cache in ${WRKSRC} instead of ~/.cache.
MAKE_ENV=	HOME=${WRKDIR}

.include <bsd.port.mk>
