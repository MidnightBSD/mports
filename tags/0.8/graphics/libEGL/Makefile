# $MidnightBSD$

PORTNAME=	libEGL
PORTVERSION=	${MESAVERSION}
PORTREVISION=	${LIBEGL_REVISION}
CATEGORIES=	graphics

COMMENT=	OpenEGL library

LICENSE=	mit

LIB_DEPENDS+=	libpthread-stubs.so:${PORTSDIR}/devel/libpthread-stubs \
		libexpat.so:${PORTSDIR}/textproc/expat2 \
		libdevq.so:${PORTSDIR}/devel/libdevq \
		libdrm.so:${PORTSDIR}/graphics/libdrm
BUILD_DEPENDS+=	${PYTHON_SITELIBDIR}/libxml2mod.so:${PORTSDIR}/textproc/py-libxml2

USES+=		python:2

USE_XORG=	x11 xau xcb xdmcp

# stuff not needed by libEGL but configure wants it
USE_XORG+=	glproto dri2proto xext xdamage xfixes presentproto \
		xshmfence

.include <bsd.mport.options.mk>
.include "${.CURDIR}/../../graphics/libGL/bsd.mesalib.mk"

.if defined(WITH_NEW_MESA)
BUILD_WRKSRC=	src/egl/drivers/dri2 src/egl/main
INSTALL_WRKSRC=	src/egl/drivers/dri2 src/egl/main
.else
BUILD_WRKSRC=	${WRKSRC}/src/egl
INSTALL_WRKSRC=	${WRKSRC}/src/egl
.endif

.if defined(WITH_NEW_MESA)
LIBEGL_REVISION=	0
.else
LIBEGL_REVISION=	5
.endif

.if defined(WITH_NEW_MESA)
do-build: egl-do-build
do-install: egl-do-install

egl-do-build:
. for dir in ${BUILD_WRKSRC}
	@(cd ${WRKSRC}/${dir}; ${DO_MAKE_BUILD} ${ALL_TARGET};)
. endfor

egl-do-install:
. for dir in ${INSTALL_WRKSRC}
	@(cd ${WRKSRC}/${dir} && ${SETENV} ${MAKE_ENV} ${FAKE_MAKEENV} ${MAKE_CMD} \
		${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${INSTALL_TARGET})

. endfor
.endif

post-install:
	@${MKDIR} ${PREFIX}/lib/.mesa
	@${MV} $${PREFIX}/lib/libEGL* \
		${PREFIX}/lib/.mesa/

.include <bsd.port.mk>
