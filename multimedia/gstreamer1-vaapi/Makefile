PORTNAME=	gstreamer1-vaapi
PORTVERSION=	${_GST_VERSION}
CATEGORIES=	multimedia
MASTER_SITES=	https://gstreamer.freedesktop.org/src/gstreamer-vaapi/
DISTNAME=	gstreamer-vaapi-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GStreamer hardware video decoding via VA-API plug-in
WWW=		https://github.com/GStreamer/gstreamer-vaapi

LICENSE=	lgpl2.1

LIB_DEPENDS=	libva.so:multimedia/libva

USES=		bison compiler:c11 gettext-runtime gl gnome gstreamer libtool \
		meson ninja pkgconfig python:build tar:xz xorg
USE_GNOME=	glib20
USE_GSTREAMER=	bad
USE_GL=		gl
USE_LDCONFIG=	yes
USE_XORG=	x11 xrandr xrender xorgproto

MESON_ARGS=	-Ddoc=disabled -Dexamples=disabled

BINARY_ALIAS=	python3=${PYTHON_VERSION}

OPTIONS_DEFINE=	DRM WAYLAND
OPTIONS_DEFAULT=DRM WAYLAND

DRM_DESC=		KMS console and headless support
DRM_BUILD_DEPENDS=	libdrm>0:graphics/libdrm
DRM_LIB_DEPENDS=	libudev.so:devel/libudev-devd
DRM_MESON_ENABLED=	drm

WAYLAND_BUILD_DEPENDS=	wayland-protocols>=1.15:graphics/wayland-protocols
WAYLAND_LIB_DEPENDS=	libva-wayland.so:multimedia/libva \
			libwayland-client.so:graphics/wayland
WAYLAND_MESON_ENABLED=	wayland
WAYLAND_IMPLIES=	DRM

NO_TEST=	yes

.include <bsd.port.mk>
