PORTNAME=	xf86-video-vmware
PORTVERSION=	13.3.0
PORTREVISION=	2
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org vmware display driver

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

ONLY_FOR_ARCHS=	amd64 i386
ONLY_FOR_ARCHS_REASON=	The vmware gfx protocol is only supported on x86-compatible architectures.

USES=		xorg-cat:driver

LIB_DEPENDS+=	libdrm.so:graphics/libdrm \
		libxatracker.so:graphics/libxatracker

CONFIGURE_ARGS= --without-libudev

.include <bsd.mport.options.mk>

.if ${ARCH} == i386
USE_GCC=	7
.endif

.include <bsd.port.mk>
