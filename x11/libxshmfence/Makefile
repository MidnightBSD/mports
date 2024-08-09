PORTNAME=	libxshmfence
PORTVERSION=	1.3.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shared memory 'SyncFence' synchronization primitive
WWW=		https://gitlab.freedesktop.org/xorg/lib/libxshmfence

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz xorg xorg-cat:lib
USE_XORG=	xorgproto

CONFIGURE_ARGS=	--with-shared-memory-dir=/tmp
INSTALL_TARGET=	install-strip
TEST_TARGET=	check

.include <bsd.port.mk>
