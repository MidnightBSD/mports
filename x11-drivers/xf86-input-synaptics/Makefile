# $MidnightBSD$

PORTNAME=	xf86-input-synaptics
PORTVERSION=	1.9.1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org synaptics input driver

LICESNE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		pathfix
USE_XORG=	x11 xtst
XORG_CAT=	driver

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

OPTIONS_DEFINE=	EVDEV
EVDEV_DESC=	Use evdev for input events (requires kernel support)

EVDEV_CONFIGURE_ENV=	BUILD_EVENTCOMM=yes
EVDEV_BUILD_DEPENDS=	${LOCALBASE}/include/linux/input.h:multimedia/v4l_compat
EVDEV_LIB_DEPENDS=	libevdev.so:devel/libevdev

.include <bsd.port.mk>
