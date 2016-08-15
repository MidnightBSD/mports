# $MidnightBSD$
# $FreeBSD: head/x11/libxkbcommon/Makefile 384234 2015-04-18 15:34:36Z kwm $

PORTNAME=	libxkbcommon
PORTVERSION=	0.5.0
CATEGORIES=	x11
MASTER_SITES=	http://xkbcommon.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Keymap handling library for toolkits and window systems

LICENSE=	mit

XORG_CAT=	lib
USES=		gmake bison tar:xz

USE_XORG=	xcb
MAKE_JOBS_UNSAFE=	yes
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--without-default-layout \
		--without-default-model \
		--without-default-options \
		--without-default-rules \
		--without-default-variant \
		--without-doxygen

.include <bsd.port.mk>
