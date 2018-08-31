# Created by: kwm@FreeBSD.org
# $MidnightBSD$
# $FreeBSD: head/graphics/libglesv2/Makefile 373491 2014-11-27 14:48:48Z kwm $

PORTNAME=	libglesv2
PORTVERSION=	${MESAVERSION}
PORTREVISION=	0
CATEGORIES=	graphics

COMMENT=	OpenGL ES v2 library

LICENSE=	mit

LIB_DEPENDS+=	libdrm.so:graphics/libdrm \
		libglapi.so:graphics/libglapi \
		libexpat.so:textproc/expat2

# stuff not needed by libglesv2 but configure wants it
USE_XORG+=	dri2proto dri3proto glproto presentproto xdamage xext xfixes \
		xshmfence

.include <bsd.mport.options.mk>
.include "${.CURDIR}/../../graphics/libGL/Makefile.common"

BUILD_WRKSRC=	${WRKSRC}/src/mapi
INSTALL_WRKSRC=	${WRKSRC}/src/mapi

.include "${.CURDIR}/../../graphics/libGL/Makefile.targets"

.include <bsd.port.mk>
