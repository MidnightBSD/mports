# $MidnightBSD: mports/graphics/libGLU/Makefile,v 1.4 2009/04/14 23:28:01 laffer1 Exp $

PORTNAME=	libGLU
PORTVERSION=	${MESAVERSION}
PORTREVISION=	1
CATEGORIES=	graphics

COMMENT=	OpenGL utility library

USE_GL=		gl
USE_XORG=	glproto x11 xext xxf86vm xdamage xfixes dri2proto

do-install:
	@${MKDIR} ${PREFIX}/include/GL/
	cd ${WRKSRC}/src/glu; ${GMAKE} ${FAKE_MAKEARGS} install
	${INSTALL_DATA} ${WRKSRC}/include/GL/glu*.h ${PREFIX}/include/GL/
	cd ${WRKSRC}/src/glu; ${GMAKE} ${FAKE_MAKEARGS} install

.include "${.CURDIR}/../../graphics/libGL/bsd.mesalib.mk"

.include <bsd.port.pre.mk>

.if ${ARCH} != "amd64" || ${ARCH} != "i386"
CONFIGURE_ARGS+=--disable-gallium-intel
.endif

.include <bsd.port.post.mk>
