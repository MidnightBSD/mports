# Created by: Johan Str??m <johan@stromnet.se>
# $FreeBSD: head/devel/jsoncpp/Makefile 424299 2016-10-20 01:25:03Z cpm $

PORTNAME=	jsoncpp
DISTVERSION=	1.7.2
CATEGORIES=	devel

MAINTAINER=	yuri@rawbw.com
COMMENT=	JSON reader and writer library for C++

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	open-source-parsers

USES=		dos2unix scons
USE_LDCONFIG=	yes

MAKE_ARGS=	platform=linux-gcc

.include <bsd.port.pre.mk>

pre-patch: dos2unix

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/include/jsoncpp
	(cd ${WRKSRC}/include/ && ${COPYTREE_SHARE} json/ ${STAGEDIR}${PREFIX}/include/jsoncpp/)
	${INSTALL_DATA} ${WRKSRC}/libs/linux-gcc-FreeBSD/libjsoncpp.a \
		${STAGEDIR}${PREFIX}/lib
	${INSTALL_LIB} ${WRKSRC}/libs/linux-gcc-FreeBSD/libjsoncpp.so.${DISTVERSION} \
		${STAGEDIR}${PREFIX}/lib
	${LN} -s libjsoncpp.so.${DISTVERSION} ${STAGEDIR}${PREFIX}/lib/libjsoncpp.so.1
	${LN} -s libjsoncpp.so.${DISTVERSION} ${STAGEDIR}${PREFIX}/lib/libjsoncpp.so
	${CP} ${WRKSRC}/pkg-config/jsoncpp.pc.in ${STAGEDIR}${PREFIX}/libdata/pkgconfig/jsoncpp.pc
	@${REINPLACE_CMD} -i '' \
		-e 's|@CMAKE_INSTALL_PREFIX@|${TRUE_PREFIX}|g' \
		-e 's|@LIBRARY_INSTALL_DIR@|lib|g' \
		-e 's|@INCLUDE_INSTALL_DIR@|include/jsoncpp|g' \
		-e 's|@JSONCPP_VERSION@|${DISTVERSION}|g' \
		${PREFIX}/libdata/pkgconfig/jsoncpp.pc

.include <bsd.port.post.mk>
