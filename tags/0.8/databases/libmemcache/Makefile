# $MidnightBSD$

PORTNAME=	libmemcache
DISTVERSION=	1.4.0.rc2
PORTREVISION=	2
CATEGORIES=	databases
MASTER_SITES=	http://people.FreeBSD.org/~seanc/libmemcache/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The C library for accessing a memcache cluster

LICENSE=	mit

USES=		libtool tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DEBUG

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=--enable-debug
.endif

post-install:
	cd ${PREFIX}/lib && ${LN} -sf libmemcache.so.4.0 libmemcache.so

.include <bsd.port.mk>
