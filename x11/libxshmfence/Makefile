# $MidnightBSD$
# $FreeBSD: head/x11/libxshmfence/Makefile 384234 2015-04-18 15:34:36Z kwm $

PORTNAME=	libxshmfence
PORTVERSION=	1.2
PORTREVISION=	2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shared memory 'SyncFence' synchronization primitive

LICENSE=	mit

USE_XORG=	xorgproto
XORG_CAT=	lib

CONFIGURE_ARGS=	--with-shared-memory-dir=/tmp
INSTALL_TARGET=	install-strip
TEST_TARGET=	check

.include <bsd.port.mk>
