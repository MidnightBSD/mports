# $MidnightBSD: mports/graphics/libGLw/Makefile,v 1.3 2013/02/22 00:30:03 laffer1 Exp $

PORTNAME=	libGLw
PORTVERSION=	${MESAVERSION}
PORTREVISION=	1
CATEGORIES=	graphics

COMMENT=	OpenGL widgets library
LICENSE=	mit

USE_GL=		gl
USE_MOTIF=	yes
USE_XORG=	glproto xt x11 xext xxf86vm xdamage xfixes dri2proto

do-install:
	cd ${WRKSRC}/src/glw; ${GMAKE} ${FAKE_MAKEARGS} install

.include "${.CURDIR}/../../graphics/libGL/bsd.mesalib.mk"

.include <bsd.port.pre.mk>

.if ${ARCH} != "amd64" || ${ARCH} != "i386"
CONFIGURE_ARGS+=--disable-gallium-intel
.endif

.include <bsd.port.post.mk>
