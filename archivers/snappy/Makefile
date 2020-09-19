# Created by: Vanilla I. Shu <vanilla@FreeBSD.org>

PORTNAME=	snappy
PORTVERSION=	1.1.8
CATEGORIES=	archivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast compressor/decompressor library

LICENSE=	bsd3

USES=		cmake compiler:c++11-lang
USE_LDCONFIG=	yes
CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_OFF=	SNAPPY_BUILD_TESTS
CMAKE_BUILD_TYPE=	Release
USE_GITHUB=	yes
GH_ACCOUNT=	google
PLIST_SUB+=	PORTVERSION=${PORTVERSION}
SUB_FILES+=	snappy.pc
SUB_LIST+=	PORTVERSION=${PORTVERSION}

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${LOCALBASE}/lib/libsnappy.so.${PORTVERSION}
	${INSTALL_DATA} ${WRKDIR}/snappy.pc ${FAKE_DESTDIR}${LOCALBASE}/libdata/pkgconfig

.include <bsd.port.mk>
