# New ports collection makefile for:   xextensions
# Date Created:			28 Oct, 2003
# Whom:				Eric Anholt <anholt@FreeBSD.org>
#
# $MidnightBSD: mports/x11/xextensions/Makefile,v 1.1 2006/10/04 16:18:19 laffer1 Exp $
# $FreeBSD: ports/x11/xextensions/Makefile,v 1.13 2005/06/15 02:42:11 lesi Exp $
#

PORTNAME=	xextensions
PORTVERSION=	1.0.1
PORTREVISION=	2
CATEGORIES=	x11
MASTER_SITES=	http://freedesktop.org/~ajax/xlibs-release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 extension headers
LICENSE=	x11

RUN_DEPENDS=	${X11BASE}/libdata/pkgconfig/xproto.pc:${PORTSDIR}/x11/xproto

CONFLICTS=	xorg-libraries-*

USE_BZIP2=	yes
PREFIX?=	${X11BASE}
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_GMAKE=	yes
NO_BUILD=	yes
USE_GNOME=	gnomehack

.include <bsd.port.mk>
