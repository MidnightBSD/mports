# $MidnightBSD$
# $FreeBSD: head/devel/libcxxrt/Makefile 385847 2015-05-09 01:12:50Z amdmi3 $

PORTNAME=	libcxxrt
PORTVERSION=	20131225
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the Code Sourcery C++ ABI

LICENSE=	bsd2

USE_GITHUB=	yes
GH_ACCOUNT=	pathscale
GH_TAGNAME=	2f150a6

WRKSRC=		${WRKDIR}/libcxxrt-${GH_TAGNAME}

USES=		cmake compiler:c++11-lang
CXXFLAGS+=	-nostdlib

do-install:
	${INSTALL_LIB} ${WRKSRC}/lib/libcxxrt.so ${STAGEDIR}${PREFIX}/lib
	${INSTALL_DATA} ${WRKSRC}/lib/libcxxrt.a ${STAGEDIR}${PREFIX}/lib
	@${MKDIR} ${STAGEDIR}${PREFIX}/include/cxxrt
	${INSTALL_DATA} ${WRKSRC}/src/*.h ${STAGEDIR}${PREFIX}/include/cxxrt

.include <bsd.port.mk>
