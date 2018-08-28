# $MidnightBSD$

PORTNAME=	jsoncpp
DISTVERSION=	0.6.0-rc2
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/jsoncpp/${DISTVERSION}
DISTNAME=	jsoncpp-src-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON reader and writer library for C++

LICENSE=	mit

USES=		dos2unix scons python:2
USE_LDCONFIG=	yes

MAKE_ARGS=	platform=linux-gcc

pre-patch: dos2unix

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/include/jsoncpp
	(cd ${WRKSRC}/include/ && ${COPYTREE_SHARE} json/ ${STAGEDIR}${PREFIX}/include/jsoncpp/)
	${INSTALL_DATA} ${WRKSRC}/libs/linux-gcc-FreeBSD/libjsoncpp.a \
		${STAGEDIR}${PREFIX}/lib
	${INSTALL_LIB} ${WRKSRC}/libs/linux-gcc-FreeBSD/libjsoncpp.so.0.6.0 \
		${STAGEDIR}${PREFIX}/lib
	${LN} -s libjsoncpp.so.0.6.0 ${STAGEDIR}${PREFIX}/lib/libjsoncpp.so.0
	${LN} -s libjsoncpp.so.0.6.0 ${STAGEDIR}${PREFIX}/lib/libjsoncpp.so

.include <bsd.port.mk>
