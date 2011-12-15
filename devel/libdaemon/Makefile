# New ports collection makefile for:	libdaemon
# Date created:		2005-10-17
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/devel/libdaemon/Makefile,v 1.6 2011/02/02 20:17:33 laffer1 Exp $
# $FreeBSD: ports/devel/libdaemon/Makefile,v 1.5 2006/02/23 10:35:51 ade Exp $
#

PORTNAME=	libdaemon
PORTVERSION=	0.12
PORTREVISION=	1
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
