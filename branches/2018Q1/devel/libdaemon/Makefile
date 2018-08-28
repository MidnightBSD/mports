# New ports collection makefile for:	libdaemon
#
# $MidnightBSD$
# $FreeBSD: ports/devel/libdaemon/Makefile,v 1.5 2006/02/23 10:35:51 ade Exp $

PORTNAME=	libdaemon
PORTVERSION=	0.14
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://0pointer.de/lennart/projects/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight C library that eases the writing of UNIX daemons
LICENSE=	lgpl

CONFIGURE_ARGS=	--disable-lynx
GNU_CONFIGURE=	yes
USES=		libtool:keepla pathfix
USE_LDCONFIG=	yes

.include <bsd.port.mk>
