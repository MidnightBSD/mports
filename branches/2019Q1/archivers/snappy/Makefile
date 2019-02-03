# $MidnightBSD$

PORTNAME=	snappy
PORTVERSION=	1.1.3
CATEGORIES=	archivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast compressor/decompressor library

LICENSE=	bsd3

OPTIONS_DEFINE=	DOCS

USES=		pkgconfig autoreconf libtool
CONFIGURE_ARGS=	--disable-gtest
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CFLAGS+=	-DNDEBUG
USE_GITHUB=	yes
GH_ACCOUNT=	google

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${LOCALBASE}/lib/libsnappy.so.1.3.0

.include <bsd.port.mk>
