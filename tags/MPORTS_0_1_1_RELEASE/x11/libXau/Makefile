# New ports collection makefile for:   libXau
# Date Created:			29 Oct, 2003
# Whom:				Eric Anholt <anholt@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11/libXau/Makefile,v 1.13 2006/02/23 10:39:52 ade Exp $
#

PORTNAME=	libXau
PORTVERSION=	0.1.1
PORTREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	http://freedesktop.org/~ajax/xlibs-release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Authentication Protocol library for X11

BUILD_DEPENDS=	${X11BASE}/libdata/pkgconfig/xproto.pc:${PORTSDIR}/x11/xproto

CONFLICTS=	XFree86-libraries-* xorg-libraries-*

USE_BZIP2=	yes
PREFIX?=	${X11BASE}
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_GMAKE=	yes
USE_GNOME=	gnomehack pkgconfig

INSTALLS_SHLIB=	yes

.include <bsd.port.mk>
