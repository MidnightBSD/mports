PORTNAME=	libuv
PORTVERSION=	1.34.1
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-platform support library with a focus on asynchronous I/O

LICENSE=	NODE
LICENSE_NAME=	NODE
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USE_GITHUB=	yes

USES=		autoreconf libtool pathfix pkgconfig python:build,test shebangfix
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
SHEBANG_FILES=	gyp_uv.py

NO_TEST=	yes

pre-configure:
	${ECHO_CMD} "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [ serial-tests])" \
		> ${WRKSRC}/m4/libuv-extra-automake-flags.m4

.include <bsd.port.mk>
