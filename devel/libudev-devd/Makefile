PORTNAME=	libudev-devd
DISTVERSIONPREFIX=	v
DISTVERSION=	0.4.2
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	libudev-compatible interface for devd

LICENSE=	bsd2

BUILD_DEPENDS=	${LOCALBASE}/include/linux/input.h:devel/evdev-proto

USE_GITHUB=	yes
GH_ACCOUNT=	FreeBSDDesktop

USES=		compiler:c11 localbase meson
USE_LDCONFIG=	yes

PLIST_FILES=	include/libudev.h \
		lib/libudev.so \
		lib/libudev.so.0 \
		lib/libudev.so.0.0.0 \
		libdata/pkgconfig/libudev.pc

.include <bsd.port.mk>
