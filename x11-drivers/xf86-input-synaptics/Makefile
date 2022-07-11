PORTNAME=	xf86-input-synaptics
PORTVERSION=	1.9.2
CATEGORIES=	x11-drivers
DISTFILES=	${PORTNAME}-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org synaptics input driver

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		pathfix xorg xorg-cat:driver tar:xz
USE_XORG=	x11 xtst

OPTIONS_DEFINE=	EVDEV
EVDEV_DESC=	Use evdev for input events (requires kernel support)

EVDEV_CONFIGURE_ENV=	BUILD_EVENTCOMM=yes
EVDEV_BUILD_DEPENDS=	${LOCALBASE}/include/linux/input.h:devel/evdev-proto
EVDEV_LIB_DEPENDS=	libevdev.so:devel/libevdev

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4

.include <bsd.port.mk>
