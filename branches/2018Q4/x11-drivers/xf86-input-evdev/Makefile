# $MidnightBSD$

PORTNAME=	xf86-input-evdev
PORTVERSION=	2.10.6
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org event device input driver

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	v4l_compat>=1.0.20110603:multimedia/v4l_compat
LIB_DEPENDS=	libevdev.so:devel/libevdev \
		libmtdev.so:devel/libmtdev
RUN_DEPENDS=	webcamd>=3.1.0.1:multimedia/webcamd

XORG_CAT=	driver
USES=		pathfix
CONFIGURE_ENV=	UDEV_CFLAGS=" " UDEV_LIBS=" "

.include <bsd.port.mk>
