PORTNAME=	svt-hevc
DISTVERSIONPREFIX=	v
DISTVERSION=	1.5.1
CATEGORIES=	multimedia
PKGNAMEPREFIX=	gstreamer1-plugins-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GStreamer (svt-hevc) plugin
WWW=		https://01.org/svt

LICENSE=	lgpl2.1+
LICENSE_FILE=	${_LICENSE_STORE}/LGPL21

LIB_DEPENDS=	libSvtHevcEnc.so:multimedia/svt-hevc

USES=		gnome gstreamer meson pkgconfig
USE_GITHUB=	yes
USE_GNOME=	glib20
GH_ACCOUNT=	OpenVisualCloud
GH_PROJECT=	SVT-HEVC
WRKSRC_SUBDIR=	gstreamer-plugin
PLIST_FILES=	lib/gstreamer-1.0/libgstsvthevcenc.so

post-patch:
	@${REINPLACE_CMD} '/-O2/d' ${WRKSRC}/meson.build

.include <bsd.port.mk>
