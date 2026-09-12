PORTNAME=	localsearch
PORTVERSION=	3.10.2
PORTREVISION=	0
CATEGORIES=	sysutils
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	collection of data extractors for Tracker/Nepomuk
WWW=		https://gnome.pages.gitlab.gnome.org/localsearch/

LICENSE=	lgpl2.1+ gpl2+
LICENSE_COMB=	multi
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/COPYING.LGPL
LICENSE_FILE_gpl2+ =	${WRKSRC}/COPYING.GPL

BUILD_DEPENDS=	a2x:textproc/asciidoc
LIB_DEPENDS=	libexempi.so:textproc/exempi \
		libavformat.so:multimedia/ffmpeg \
		libgexiv2.so:graphics/gexiv2 \
		libgudev-1.0.so:devel/libgudev \
		libcue.so:textproc/libcue \
		libexif.so:graphics/libexif \
		libgsf-1.so:devel/libgsf \
		libgxps.so:graphics/libgxps \
		libiptcdata.so:graphics/libiptcdata \
		libosinfo-1.0.so:devel/libosinfo \
		libpoppler-glib.so:graphics/poppler-glib \
		libtiff.so:graphics/tiff \
		libtinysparql-3.0.so.0:devel/tinysparql \
		libtotem-plparser.so:multimedia/totem-pl-parser \
		libupower-glib.so:sysutils/upower \
		libwebpdemux.so:graphics/webp \
		libgif.so:graphics/giflib

USES=	tar:xz meson pkgconfig gstreamer gnome gettext
USE_GSTREAMER=	core good bad
USE_GNOME=	glib20

GLIB_SCHEMAS=	org.freedesktop.Tracker3.Extract.gschema.xml \
		org.freedesktop.Tracker3.FTS.gschema.xml \
		org.freedesktop.Tracker3.Miner.Files.gschema.xml \
		org.freedesktop.TrackerMiners3.enums.xml

LDFLAGS=	-L/usr/local/lib
MESON_ARGS=	-Dfunctional_tests=false \
		-Dsystemd_user_services=false \
		-Dlandlock=disabled \
		-Dfanotify=disabled

NO_TEST=	yes

.include <bsd.port.mk>
