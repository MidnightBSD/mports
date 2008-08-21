# New ports collection makefile for:	libdaemon
# Date created:		2005-10-17
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/devel/libdaemon/Makefile,v 1.3 2007/08/14 20:48:00 laffer1 Exp $
# $FreeBSD: ports/devel/libdaemon/Makefile,v 1.5 2006/02/23 10:35:51 ade Exp $
#

PORTNAME=	libdaemon
PORTVERSION=	0.12
CATEGORIES=	devel
MASTER_SITES=	http://0pointer.de/lennart/projects/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight C library that eases the writing of UNIX daemons
LICENSE=	lgpl

CONFIGURE_ARGS=	--disable-lynx
USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnomehack gnometarget ltverhack
USE_LDCONFIG=	yes

.include <bsd.port.mk>
