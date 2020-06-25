PORTNAME=	xf86-video-intel
PORTVERSION=	2.99.917.20181203
PORTREVISION=	1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Driver for Intel integrated graphics chipsets

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

ONLY_FOR_ARCHS=	amd64 i386
ONLY_FOR_ARCHS_REASON=	Intel integrated GPU only exists in Intel x86 processors/chipsets

LIB_DEPENDS=	libxcb-util.so:x11/xcb-util \
		libdrm.so:graphics/libdrm

USES=		cpe gl xorg xorg-cat:driver libtool
USE_GITLAB=	yes
GL_COMMIT=	e5ff8e1828f97891c819c919d7115c6e18b2eb1f
USE_GL=		gl
USE_XORG=	pciaccess pixman x11 xcb xext xrender xv xvmc
USE_LDCONFIG=	yes

CPE_VENDOR=	x

OPTIONS_SINGLE=	ACCEL
OPTIONS_SINGLE_ACCEL=	SNA UXA
OPTIONS_DEFAULT=	UXA

ACCEL_DESC=	Default AccelMethod (if not specified in xorg.conf)
SNA_DESC=	SandyBridge's New Acceleration
UXA_DESC=	Unified Acceleration Architecture

CONFIGURE_ARGS+=	--disable-udev
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

SNA_CONFIGURE_ON=	--with-default-accel=sna
UXA_CONFIGURE_ON=	--with-default-accel=uxa

.include <bsd.port.mk>
