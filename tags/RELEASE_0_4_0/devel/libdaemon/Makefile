# New ports collection makefile for:	libdaemon
#
# $MidnightBSD: mports/devel/libdaemon/Makefile,v 1.7 2011/12/15 00:34:40 laffer1 Exp $
# $FreeBSD: ports/devel/libdaemon/Makefile,v 1.5 2006/02/23 10:35:51 ade Exp $

PORTNAME=	libdaemon
PORTVERSION=	0.14
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	http://0pointer.de/lennart/projects/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight C library that eases the writing of UNIX daemons
LICENSE=	lgpl

CONFIGURE_ARGS=	--disable-lynx
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack ltverhack
USE_LDCONFIG=	yes

.include <bsd.port.mk>
