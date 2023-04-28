PORTNAME=	libdeflate
PORTVERSION=	1.18
DISTVERSIONPREFIX=	v
CATEGORIES=	archivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, whole-buffer DEFLATE-based compression library
WWW=		https://github.com/ebiggers/libdeflate

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake:testing pathfix
USE_GITHUB=	yes
GH_ACCOUNT=	ebiggers
USE_LDCONFIG=	yes
CMAKE_ON=	LIBDEFLATE_USE_SHARED_LIB
CMAKE_TESTING_ON=	LIBDEFLATE_BUILD_TESTS

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e '/-O2 -DNDEBUG/d' ${WRKSRC}/CMakeLists.txt

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.md ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
