# Created by: Alexander Churanov <churanov.port.maintainer@gmail.com>
# $MidnightBSD$

PORTNAME=	boost-jam
COMMENT=	Build tool from the boost.org

LICENSE=	mit

PLIST_FILES=	bin/bjam

EXTRACT_AFTER_ARGS=	${DISTNAME}/${WRKSRC_SUBDIR}
MAKE_CMD=	./build.sh
ALL_TARGET=	${CHOSEN_COMPILER_TYPE} ${WITH_DEBUG:D--debug}
MAKE_FLAGS=	#
_MAKE_JOBS=	#
MAKEFILE=	#

USES=		compiler:c++11-lang

WRKSRC_SUBDIR=	tools/build/src/engine

.include "${.CURDIR}/../boost-all/common.mk"

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bjam ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
