PORTNAME=	gstreamer
DISTVERSION=	${_GST_VERSION}
CATEGORIES=	multimedia python
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gst-python/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	1
DISTNAME=	gst-python-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GStreamer python bindings
WWW=		https://gstreamer.freedesktop.org/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	meson>=1.4,1:devel/meson
BUILD_RUN_DEPENDS=	gstreamer1>=1.28.0:multimedia/gstreamer1 \
		${PYTHON_PKGNAMEPREFIX}pygobject>=3.8:devel/py-pygobject@${PY_FLAVOR}

PORTSCOUT=	limitw:1,even

USES=		cpe gnome gstreamer meson pkgconfig python tar:xz
CPE_VENDOR=	${PORTNAME}_project
USE_GNOME=	pygobject3
USE_PYTHON=	flavors
USE_GSTREAMER=	bad rtsp-server webrtc
PLIST_SUB=	VERSION="${_GST_VERSION}"
BINARY_ALIAS=	python3=${PYTHON_VERSION}

NO_TEST=	yes

post-install:
	${PYTHON_CMD} -m compileall -d ${PYTHON_SITELIBDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}
	${PYTHON_CMD} -O -m compileall -d ${PYTHON_SITELIBDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

.include <bsd.port.mk>
