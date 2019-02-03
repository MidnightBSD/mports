# $FreeBSD: head/graphics/gstreamer1-plugins-gl/Makefile 393429 2015-08-02 15:03:19Z tijl $

PORTREVISION=	1
CATEGORIES=	graphics

COMMENT=	GStreamer GL graphics plugin

GST_PLUGIN=	gl
DIST=		bad

GL_GST_DIRS=	gst-libs/gst/allocators
PLIST=		${.CURDIR}/pkg-plist

MASTERDIR=	${.CURDIR}/../../multimedia/gstreamer1-plugins

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

pre-build:
.for dir in ${GL_GST_DIRS}
	@(cd ${BUILD_WRKSRC}/${dir}; ${SETENV} ${MAKE_ENV} ${FAKE_MAKEENV} ${MAKE_CMD} ${MAKE_FLAGS} ${MAKEFILE} ${_MAKE_JOBS} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${ALL_TARGET})
.endfor

post-install:
	${INSTALL_DATA} ${WRKSRC}/pkgconfig/gstreamer-gl.pc \
		${STAGEDIR}${PREFIX}/libdata/pkgconfig/gstreamer-gl-1.0.pc

.include "${MASTERDIR}/Makefile"
