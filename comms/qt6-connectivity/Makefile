PORTNAME=	connectivity
DISTVERSION=	${QT6_VERSION}
PORTREVISION=	1
CATEGORIES=	comms
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt connectivity (Bluetooth/NFC) module

BUILD_DEPENDS=	vulkan-headers>0:graphics/vulkan-headers
LIB_DEPENDS=	libpcsclite.so:devel/pcsc-lite

USES=		cmake compiler:c++11-lang pkgconfig qt-dist:6,connectivity
USE_QT=		base
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
