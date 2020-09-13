PORTNAME=	libxshmfence
PORTVERSION=	1.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shared memory 'SyncFence' synchronization primitive

LICENSE=	mit

USES=		xorg xorg-cat:lib
USE_XORG=	xorgproto

CONFIGURE_ARGS=	--with-shared-memory-dir=/tmp
INSTALL_TARGET=	install-strip
TEST_TARGET=	check

.include <bsd.port.mk>
