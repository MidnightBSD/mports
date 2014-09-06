# $MidnightBSD$

PORTNAME=	lzop
DISTVERSION=	1.03
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	http://www.lzop.org/download/ \
		FREEBSD_LOCAL/mandree

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast file compressor similar to gzip, using the LZO library

LICENSE=	gpl2

# prefer lzo2 if it is already installed or if no lzo is installed.
.if exists(${LOCALBASE}/lib/liblzo2.so.2) || !exists(${LOCALBASE}/lib/liblzo.so.1)
LIB_DEPENDS=	lzo2.2:${PORTSDIR}/archivers/lzo2
.else
LIB_DEPENDS=	lzo.1:${PORTSDIR}/archivers/lzo
.endif

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=""
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_FILES=	bin/lzop man/man1/lzop.1.gz

.include <bsd.port.mk>
