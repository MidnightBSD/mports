PORTNAME=	Horde_HashTable
PORTVERSION=	1.2.6
CATEGORIES=	databases www pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Horde Hash Table Interface
WWW=		https://pear.horde.org

LICENSE=	lgpl2.1

OPTIONS_DEFINE=	MEMCACHE
USES=		horde cpe
USE_HORDE_RUN=	Horde_Exception

MEMCACHE_USE=	HORDE_RUN=Horde_Memcache

.include <bsd.port.mk>
