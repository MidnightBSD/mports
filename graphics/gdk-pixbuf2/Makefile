PORTNAME=	gdk-pixbuf
PORTVERSION=	2.42.12
CATEGORIES=	graphics
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	2
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphic library for GTK
WWW=		https://developer.gnome.org/gdk-pixbuf/

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe gettext gnome localbase:ldflags meson pkgconfig \
		python:build shared-mime-info shebangfix tar:xz trigger
CPE_VENDOR=	gnome
USE_GNOME=	glib20 introspection:build libxslt:build
SHEBANG_FILES=	build-aux/*.py
USE_LDCONFIG=	yes
MESON_ARGS=	-Dbuiltin_loaders="none" -Dgtk_doc=false -Dinstalled_tests=false -Dtests=false
TRIGGERS=	gdk-pixbuf-query-loaders
SUB_LIST=	GTK2_VERSION=${GTK2_VERSION}

LIBVERSION=	0.4200.12
PLIST_SUB+=	LIBVERSION=${LIBVERSION}

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	GIF JPEG MANPAGES PNG TIFF
OPTIONS_DEFAULT=GIF JPEG MANPAGES PNG TIFF

GIF_MESON_ENABLED=	gif

JPEG_USES=		jpeg
JPEG_MESON_ENABLED=	jpeg

MANPAGES_BUILD_DEPENDS=	docbook-xsl>0:textproc/docbook-xsl \
			rst2man:textproc/py-docutils
MANPAGES_USE=		gnome=libxslt:build
MANPAGES_MESON_TRUE=	man

PNG_LIB_DEPENDS=	libpng.so:graphics/png
PNG_MESON_ENABLED=	png

TIFF_LIB_DEPENDS=	libtiff.so:graphics/tiff
TIFF_MESON_ENABLED=	tiff

NO_TEST=	yes

.include <bsd.port.mk>
