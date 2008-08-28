# New ports collection makefile for:   libpthread-stubs
# Date created:		24 January 2007
# Whom:			wahjava
#
# $FreeBSD: ports/devel/libpthread-stubs/Makefile,v 1.1 2007/01/29 09:20:36 miwi Exp $
# $MidnightBSD$
#

PORTNAME=	libpthread-stubs
PORTVERSION=	0.1
CATEGORIES=	devel
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	This library provides weak aliases for pthread functions
LICENSE=	x11

USE_GMAKE=	yes
USE_BZIP2=	yes
USE_GNOME=	gnomehack pkgconfig
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}

.include <bsd.port.mk>
