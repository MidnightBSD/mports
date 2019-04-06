# $MidnightBSD$

PORTNAME=	lzop
DISTVERSION=	1.04
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	http://www.lzop.org/download/ \
		FREEBSD_LOCAL/mandree

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast file compressor similar to gzip, using the LZO library

LICENSE=	gpl2

LIB_DEPENDS=	liblzo2.so:archivers/lzo2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=""
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
