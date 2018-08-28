# $MidnightBSD$

PORTNAME=	libobjc2
PORTVERSION=	1.7
CATEGORIES=	lang devel gnustep
MASTER_SITES=	http://download.gna.org/gnustep/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Replacement Objective-C runtime supporting Obj-C 2 features

LICENSE=	mit

SSP_UNSAFE=	yes

USES=		cmake tar:bzip2

.include <bsd.mport.options.mk>

_CLANG!=	if [ -f /usr/bin/clang ] ; then  /usr/bin/clang --version | head -1 | \
		${SED} -e 's/.*clang version \([0-9]\)\.\([0-9]\).*/\1\2/' ; else ${ECHO} 0 ; fi

.if ${_CLANG} < 34
BUILD_DEPENDS+=	${LOCALBASE}/bin/clang34:${PORTSDIR}/lang/clang34
CC=		${LOCALBASE}/bin/clang34
CXX=	${LOCALBASE}/bin/clang++34
.else
CC=		/usr/bin/clang
CXX=	/usr/bin/clang++
.endif

SHLIB_MAJOR=	4
SHLIB_MINOR=	6

PLIST_SUB+=	SHLIB_MAJOR=${SHLIB_MAJOR} SHLIB_MINOR=${SHLIB_MINOR}

CMAKE_ARGS+=	-DFORCE_LIBOBJCXX=ON
PLIST_SUB+=	WITH_SEPARATECXX=""

CMAKE_ARGS+=	-DLIB_INSTALL_PATH=lib
CMAKE_ARGS+=	-DTESTS=OFF
# This shouldn't be needed, but our llvm port installs llvm-config with a silly
# name...
CMAKE_ARGS+=	-DLLVM_OPTS=OFF

post-install:
	${LN} -sf libobjc.so.${SHLIB_MAJOR}.${SHLIB_MINOR} ${STAGEDIR}${PREFIX}/lib/libobjc.so.${SHLIB_MAJOR}
	${LN} -sf libobjcxx.so.${SHLIB_MAJOR}.${SHLIB_MINOR} ${STAGEDIR}${PREFIX}/lib/libobjcxx.so.${SHLIB_MAJOR}

.include <bsd.port.mk>
