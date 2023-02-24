PORTNAME=	libuv
DISTVERSION=	1.44.2
DISTVERSIONPREFIX=	v
CATEGORIES=	devel
MASTER_SITES=	https://dist.libuv.org/dist/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-platform support library with a focus on asynchronous I/O
WWW=		https://github.com/libuv/libuv

LICENSE=	NODE
LICENSE_NAME=	NODE
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		autoreconf cpe libtool pathfix pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

NO_TEST=	yes

pre-configure:
	${ECHO_CMD} "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [ serial-tests])" \
		> ${WRKSRC}/m4/libuv-extra-automake-flags.m4

.include <bsd.port.mk>
