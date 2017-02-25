# $MidnightBSD$

PORTNAME=	gstreamer
PORTVERSION=	0.10.22
CATEGORIES=	multimedia python gnome
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gst-python/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	gst-python-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for gstreamer

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/libxml2mod.so:textproc/py-libxml2
RUN_DEPENDS=	${PYTHON_SITELIBDIR}/libxml2mod.so:textproc/py-libxml2

USES=		gmake libtool pathfix pkgconfig python:2 tar:bzip2
USE_GNOME=	pygobject
USE_GSTREAMER=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
PLIST_SUB=	VERSION="${GST_VERSION}"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e 's|DLFCN|dl|g' ${WRKSRC}/gst/__init__.py
	@${REINPLACE_CMD} -e 's|alsasink|osssink|g' -e 's|alsasrc|osssrc|g' \
		${WRKSRC}/gst/extend/jukebox.py \
		${WRKSRC}/common/m4/gst-default.m4
.for d in audio-controller.py decodebin.py mixer.py vumeter.py
	@${REINPLACE_CMD} -e 's|alsasink|osssink|g' -e 's|alsasrc|osssrc|g' \
		${WRKSRC}/examples/${d}
.endfor

post-install:
	${PYTHON_CMD} -O ${PYTHON_LIBDIR}/compileall.py -d \
		${PYTHONPREFIX_SITELIBDIR} -f ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
	${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py -d \
		${PYTHONPREFIX_SITELIBDIR} -f ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

.include <bsd.port.mk>
