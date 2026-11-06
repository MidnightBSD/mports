PORTNAME=	gstreamer1-libav
DISTVERSION=	${_GST_VERSION}
CATEGORIES=	multimedia
MASTER_SITES=	https://gstreamer.freedesktop.org/src/gst-libav/
DISTNAME=	gst-libav-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GStreamer plug-in with many audio/video decoders/encoders
WWW=		https://gstreamer.freedesktop.org/

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	meson>=1.4,1:devel/meson \
		orc>=0.4.16:devel/orc
BUILD_RUN_DEPENDS=	ffmpeg>=4.0,1:multimedia/ffmpeg \
		gstreamer1>=1.28.0:multimedia/gstreamer1
LIB_DEPENDS=	liborc-0.4.so:devel/orc \
		libavcodec.so:multimedia/ffmpeg

USES=		bison gettext-runtime gnome gstreamer libtool localbase \
		meson ninja pkgconfig python:build shebangfix tar:xz
USE_GNOME=	glib20
SHEBANG_FILES=	scripts/extract-release-date-from-doap-file.py \
		scripts/gen-changelog.py \

MESON_ARGS=	-Ddoc=disabled

PORTSCOUT=	limitw:1,even

.include <bsd.port.mk>
