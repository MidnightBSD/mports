# New ports collection makefile for:   libX11
# Date Created:			28 Oct, 2003
# Whom:				Eric Anholt <anholt@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11/libX11/Makefile,v 1.12 2005/04/12 03:26:46 obrien Exp $
#

PORTNAME=	libX11
PORTVERSION=	6.2.1
PORTREVISION=	3
CATEGORIES=	x11
MASTER_SITES=	http://freedesktop.org/~ajax/xlibs-release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 library

LIB_PC_DEPENDS=	${X11BASE}/libdata/pkgconfig/xau.pc:${PORTSDIR}/x11/libXau \
		${X11BASE}/libdata/pkgconfig/xdmcp.pc:${PORTSDIR}/x11/libXdmcp
BUILD_DEPENDS=	${X11BASE}/libdata/pkgconfig/xextensions.pc:${PORTSDIR}/x11/xextensions \
		${X11BASE}/libdata/pkgconfig/xtrans.pc:${PORTSDIR}/x11/libXtrans \
		${LIB_PC_DEPENDS}
RUN_DEPENDS=	${LIB_PC_DEPENDS}

CONFLICTS=	XFree86-libraries-* xorg-libraries-*

USE_BZIP2=	yes
PREFIX?=	${X11BASE}
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_GMAKE=	yes
CONFIGURE_ARGS+= --enable-xdmauth
CFLAGS+=	-DMALLOC_0_RETURNS_NULL
INSTALLS_SHLIB=	yes
USE_GNOME=	gnomehack pkgconfig

.include <bsd.port.mk>
