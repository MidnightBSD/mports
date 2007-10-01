# New ports collection makefile for:   xproto
# Date Created:			29 Oct, 2003
# Whom:				Eric Anholt <anholt@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11/xproto/Makefile,v 1.12 2005/07/11 17:34:26 lesi Exp $
#

PORTNAME=	xproto
PORTVERSION=	6.6.2
CATEGORIES=	x11
MASTER_SITES=	http://xlibs.freedesktop.org/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 protocol headers

CONFLICTS=	XFree86-libraries-* xorg-libraries-*

USE_BZIP2=	yes
PREFIX?=	${X11BASE}
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_GMAKE=	yes
NO_BUILD=	yes
USE_GNOME=	gnomehack

.include <bsd.port.mk>
