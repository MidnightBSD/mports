# New ports collection makefile for:   libXtrans
# Date Created:			28 Oct, 2003
# Whom:				Eric Anholt <anholt@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11/libXtrans/Makefile,v 1.8 2005/07/11 17:34:25 lesi Exp $
#

PORTNAME=	libXtrans
PORTVERSION=	0.1
PORTREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	http://xlibs.freedesktop.org/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Network API translation layer for X applications and libraries

USE_BZIP2=	yes
PREFIX?=	${X11BASE}
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_GMAKE=	yes
USE_GNOME=	gnomehack

.include <bsd.port.mk>
