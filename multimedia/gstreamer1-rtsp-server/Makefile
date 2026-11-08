PORTNAME=	gstreamer1-rtsp-server
PORTVERSION=	${_GST_VERSION}
CATEGORIES=	multimedia
MASTER_SITES=	https://gstreamer.freedesktop.org/src/gst-rtsp-server/
DISTNAME=	gst-rtsp-server-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GStreamer library for building a RTSP server
WWW=		https://gstreamer.freedesktop.org/

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	meson>=1.4,1:devel/meson
BUILD_RUN_DEPENDS=	glib>=2.64.0,2:devel/glib20 \
		gstreamer1>=1.28.0:multimedia/gstreamer1

USES=		bison gnome gstreamer meson ninja pathfix pkgconfig python:build tar:xz
USE_LDCONFIG=	yes
USE_GNOME=	glib20 introspection:build
USE_GSTREAMER=	good bad
MESON_ARGS=	-Ddoc=disabled

BINARY_ALIAS=	python3=${PYTHON_VERSION}

PLIST_SUB=	SOVERSION=${_GST_SOVERSION} \
		VERSION=${_GST_LIB_VER}

.include <bsd.port.mk>
