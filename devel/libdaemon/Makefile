# New ports collection makefile for:	libdaemon
# Date created:		2005-10-17
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/devel/libdaemon/Makefile,v 1.2 2007/05/07 02:52:30 ctriv Exp $
# $FreeBSD: ports/devel/libdaemon/Makefile,v 1.5 2006/02/23 10:35:51 ade Exp $
#

PORTNAME=	libdaemon
PORTVERSION=	0.12
CATEGORIES=	devel
MASTER_SITES=	http://0pointer.de/lennart/projects/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight C library that eases the writing of UNIX daemons

CONFIGURE_ARGS=	--disable-lynx
USE_AUTOTOOLS=	libtool:15
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack gnometarget ltverhack
USE_LDCONFIG=	yes

.include <bsd.port.mk>
