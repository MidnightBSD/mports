# New ports collection makefile for:	libmemcache
# Date created:		July 31, 2008
# Whom:			Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/databases/libmemcache/Makefile,v 1.2 2009/09/20 00:34:51 laffer1 Exp $
#

PORTNAME=	libmemcache
PORTVERSION=	1.4.0.rc2
CATEGORIES=	databases
MASTER_SITES=	http://people.FreeBSD.org/~seanc/libmemcache/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The C library for accessing a memcache cluster
LICENSE=	mit

USE_BZIP2=	yes

USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

OPTIONS=	DEBUG	"Build with debugging turned on" off

.include <bsd.port.pre.mk>

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=--enable-debug
.endif

.include <bsd.port.post.mk>
