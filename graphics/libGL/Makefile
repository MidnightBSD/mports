# $MidnightBSD$

PORTNAME=	libGL
PORTVERSION=	${MESAVERSION}
PORTREVISION=	0
CATEGORIES=	graphics

COMMENT=	OpenGL library that renders using GLX or DRI

LICENSE=	mit

LIB_DEPENDS+=	libdrm.so:graphics/libdrm \
		libglapi.so:graphics/libglapi \
		libexpat.so:textproc/expat2

USE_XORG=	dri2proto dri3proto glproto presentproto x11 xcb xdamage xext \
		xfixes xshmfence xxf86vm

.include <bsd.mport.options.mk>
.include "${.CURDIR}/Makefile.common"

MESA_BUILD_WRKSRC=	src/mapi src/glx
MESA_INSTALL_WRKSRC=	src/glx

.include "${.CURDIR}/Makefile.targets"

post-install:
	@cd ${WRKSRC}/src && ${SETENV} DESTDIR=${FAKE_DESTDIR} \
		${MAKE_CMD} ${FAKE_MAKEARGS} install-pkgconfigDATA install-glHEADERS install-glxHEADERS

.include <bsd.port.mk>
