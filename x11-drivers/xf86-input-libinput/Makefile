# $MidnightBSD$
# $FreeBSD: head/x11-drivers/xf86-input-libinput/Makefile 435963 2017-03-11 21:26:06Z rezny $

PORTNAME=	xf86-input-libinput
PORTVERSION=	0.28.2
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org libinput input driver

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${LOCALBASE}/include/linux/input.h:devel/evdev-proto
LIB_DEPENDS=	libinput.so:x11/libinput

USES=		pathfix xorg-cat:driver

.include <bsd.port.mk>
