PORTNAME=	libuv
DISTVERSIONPREFIX=	v
DISTVERSION=	1.48.0
CATEGORIES=	devel
MASTER_SITES=	https://dist.libuv.org/dist/v${DISTVERSION}/
DISTNAME=	${PORTNAME}-${DISTVERSIONFULL}-dist

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-platform support library with a focus on asynchronous I/O
WWW=		https://github.com/libuv/libuv

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe libtool pathfix pkgconfig

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4
USE_LDCONFIG=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--disable-maintainer-mode

pre-configure:
	${ECHO_CMD} "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [ serial-tests])" \
		> ${WRKSRC}/m4/libuv-extra-automake-flags.m4

.include <bsd.port.mk>
