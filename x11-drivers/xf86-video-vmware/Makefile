PORTNAME=	xf86-video-vmware
PORTVERSION=	13.3.0
PORTREVISION=	4
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org vmware display driver
WWW=		https://www.x.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

ONLY_FOR_ARCHS=	amd64 i386
ONLY_FOR_ARCHS_REASON=	vmware gfx protocol is only supported on x86-compatible architectures

USES=		xorg-cat:driver

LIB_DEPENDS+=	libdrm.so:graphics/libdrm \
		libxatracker.so:graphics/mesa-gallium-xa

CONFIGURE_ARGS=	--without-libudev

.include <bsd.mport.options.mk>

.if ${ARCH} == i386
USE_GCC=	11
.endif

.include <bsd.port.mk>
