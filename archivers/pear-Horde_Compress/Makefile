PORTNAME=	Horde_Compress
PORTVERSION=	2.2.4
CATEGORIES=	archivers www pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Horde Compression API
WWW=		https://pear.horde.org

LICENSE=	lgpl2.1

OPTIONS_DEFAULT=	ZLIB
OPTIONS_DEFINE=		ZLIB
ZLIB_DESC=	Depend on PHP zlib extension

USES=		horde cpe
USE_HORDE_RUN=	Horde_Exception \
		Horde_Translation \
		Horde_Util \
		Horde_Stream_Filter

ZLIB_USES=	php
ZLIB_USE=	PHP=zlib

.include <bsd.port.mk>
