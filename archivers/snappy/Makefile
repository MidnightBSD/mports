PORTNAME=	snappy
PORTVERSION=	1.1.6
CATEGORIES=	archivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast compressor/decompressor library

LICENSE=	bsd3

OPTIONS_DEFINE=	DOCS

USES=		autoreconf compiler:c++11-lang libtool pathfix pkgconfig
CONFIGURE_ARGS=	--disable-gtest
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CFLAGS+=	-DNDEBUG
USE_GITHUB=	yes
GH_ACCOUNT=	google

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${LOCALBASE}/lib/libsnappy.so.1.1.6

.include <bsd.port.mk>
