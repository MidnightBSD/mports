PORTNAME=	xf86-input-synaptics
PORTVERSION=	1.9.1
PORTREVISION=	6
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org synaptics input driver

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		pathfix xorg xorg-cat:driver
USE_XORG=	x11 xtst

OPTIONS_DEFINE=	EVDEV
EVDEV_DESC=	Use evdev for input events (requires kernel support)

EVDEV_CONFIGURE_ENV=	BUILD_EVENTCOMM=yes
EVDEV_BUILD_DEPENDS=	${LOCALBASE}/include/linux/input.h:devel/evdev-proto
EVDEV_LIB_DEPENDS=	libevdev.so:devel/libevdev

.include <bsd.port.mk>
