PORTNAME=	svt-vp9
DISTVERSIONPREFIX=	v
DISTVERSION=	0.3.0
CATEGORIES=	multimedia
PKGNAMEPREFIX=	gstreamer1-plugins-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GStreamer (svt-vp9) plugin
WWW=		https://01.org/svt

LICENSE=	lgpl2.1+
LICENSE_FILE=	${_LICENSE_STORE}/LGPL21

LIB_DEPENDS=	libSvtVp9Enc.so:multimedia/svt-vp9

USES=		gnome gstreamer meson pkgconfig
USE_GITHUB=	yes
USE_GNOME=	glib20
GH_ACCOUNT=	OpenVisualCloud
GH_PROJECT=	SVT-VP9
WRKSRC_SUBDIR=	gstreamer-plugin
PLIST_FILES=	lib/gstreamer-1.0/libgstsvtvp9enc.so

post-patch:
	@${REINPLACE_CMD} '/-O2/d' ${WRKSRC}/meson.build

.include <bsd.port.mk>
