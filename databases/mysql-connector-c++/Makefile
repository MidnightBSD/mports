PORTNAME=	mysql-connector-c++
PORTVERSION=	8.0.33
CATEGORIES=	databases
MASTER_SITES=	MYSQL/Connector-C++
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MySQL database connector for C++
WWW=		https://dev.mysql.com/doc/relnotes/connector-cpp/en/index.html

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

LIB_DEPENDS=	libboost_regex.so:devel/boost-libs \
		liblz4.so:archivers/liblz4 \
		libprotobuf.so:devel/protobuf \
		libzstd.so:archivers/zstd

USES=		cmake:noninja compiler:c++17-lang cpe gmake mysql ssl
IGNORE_WITH_MYSQL=	105m 106m 1011m
CPE_VENDOR=	oracle
USE_CXXSTD=	c++17
USE_LDCONFIG=	yes

CMAKE_ARGS=	-DCMAKE_ENABLE_C++17=ON \
		-DWITH_LZ4=system \
		-DWITH_PROTOBUF=system \
		-DWITH_SYSTEM_LIBS=1 \
		-DWITH_ZLIB=system \
		-DWITH_ZSTD=system

PLIST_SUB=	PORTVERSION=${PORTVERSION}
PORTDOCS=	*

# jdbc is broken
OPTIONS_DEFINE=	DOCS
OPTIONS_DEFAULT=	
OPTIONS_SUB=	yes

DOCS_BUILD_DEPENDS=	doxygen:devel/doxygen
DOCS_CMAKE_ON=		-DDOC_DESTINATION="${DOCSDIR}" \
			-DWITH_DOC=ON

post-install:
	@${RM} ${PREFIX}/INFO_BIN
	@${RM} ${PREFIX}/INFO_SRC

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${BUILD_WRKSRC}/doc && \
		${COPYTREE_SHARE} html ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
