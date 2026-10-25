PORTNAME=	gstreamer1-validate
DISTVERSION=	1.28.8
CATEGORIES=	multimedia
MASTER_SITES=	https://gstreamer.freedesktop.org/src/gst-devtools/
DISTNAME=	gst-devtools-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gstreamer element validation suite
WWW=		https://gstreamer.freedesktop.org/

LICENSE=	gpl2 lgpl2.1+
LICENSE_COMB=	multi
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/validate/COPYING

LIB_DEPENDS=	libjson-glib-1.0.so:devel/json-glib \
		libgstrtspserver-1.0.so:multimedia/gstreamer1-rtsp-server \
		libharfbuzz.so:print/harfbuzz

USES=		compiler:c11 gettext-runtime gnome gstreamer meson \
		pkgconfig python shebangfix tar:xz
SHEBANG_FILES=	validate/tools/gst-validate-launcher.in
SHEBANG_FILES+=	validate/launcher/*.py validate/launcher/config.py.in \
		validate/launcher/apps/*.py validate/launcher/testsuites/*.py
USE_LDCONFIG=	yes
USE_GNOME=	cairo gdkpixbuf gtk30 introspection:build
USE_GSTREAMER=	bad
USE_PYTHON=	noflavors

BINARY_ALIAS=	python3=${PYTHON_VERSION}

MESON_ARGS=	-Dvalidate=enabled -Dcairo=enabled -Dintrospection=enabled \
		-Dtools=enabled -Dtests=enabled \
		-Ddots_viewer=disabled -Ddebug_viewer=disabled -Ddoc=disabled

PLIST_SUB=	VERSION=1.0 SOVERSION=0.2808.0

.include <bsd.port.mk>
