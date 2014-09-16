# New ports collection makefile for:	libmemcache
# Date created:		July 31, 2008
# Whom:			Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD$
#

PORTNAME=	libmemcache
DISTVERSION=	1.4.0.rc2
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	http://people.FreeBSD.org/~seanc/libmemcache/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The C library for accessing a memcache cluster

LICENSE=	mit

USES=	 	libtool tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DEBUG

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=--enable-debug
.endif

.include <bsd.port.mk>
