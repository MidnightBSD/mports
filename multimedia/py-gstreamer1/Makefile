PORTNAME=	gstreamer
DISTVERSION=	1.20.5
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

PORTSCOUT=	limitw:1,even

USES=		cpe gnome gstreamer meson pkgconfig python:3.6+ tar:xz
CPE_VENDOR=	${PORTNAME}_project
USE_GNOME=	pygobject3
USE_PYTHON=	flavors py3kplist
PLIST_SUB=	VERSION="${GST_VERSION}"
BINARY_ALIAS=	python3=${PYTHON_VERSION}

post-install:
	${PYTHON_CMD} -m compileall -d ${PYTHON_SITELIBDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}
	${PYTHON_CMD} -O -m compileall -d ${PYTHON_SITELIBDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

.include <bsd.port.mk>
