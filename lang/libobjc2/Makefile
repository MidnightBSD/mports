PORTNAME=	libobjc2
DISTVERSIONPREFIX=v
DISTVERSION=	2.1
PORTREVISION=	3
CATEGORIES=	lang devel gnustep

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Replacement Objective-C runtime supporting modern Objective-C features

LICENSE=	mit

USES=		cmake compiler objc:compiler

USE_GITHUB=	yes
GH_ACCOUNT=	gnustep
GH_TUPLE=	Tessil:robin-map:757de82:robin_map/third_party/robin-map

USE_LDCONFIG=	yes

LDFLAGS+=	-lm

#TEST_TARGET=	test
NO_TEST=	yes

CMAKE_ARGS+=	-DLIB_INSTALL_PATH=lib

LDFLAGS_armv7=	-Wl,-znotext
SSP_UNSAFE=	yes

PLIST_SUB+=	SHLIB_MAJOR=${SHLIB_MAJOR} SHLIB_MINOR=${SHLIB_MINOR}

SHLIB_MAJOR=	4
SHLIB_MINOR=	6

.include <bsd.port.pre.mk>

.if ${CHOSEN_COMPILER_TYPE} == gcc
CXXFLAGS+=	-stdlib=libstdc++
.endif

post-install:
	${LN} -sf libobjc.so.${SHLIB_MAJOR}.${SHLIB_MINOR} ${STAGEDIR}${PREFIX}/lib/libobjc.so.${SHLIB_MAJOR}

.include <bsd.port.post.mk>
