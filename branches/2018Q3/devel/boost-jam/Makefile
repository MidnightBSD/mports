# Created by: Alexander Churanov <churanov.port.maintainer@gmail.com>
# $MidnightBSD$

PORTNAME=	boost-jam
COMMENT=	Build tool from the boost.org

LICENSE=	mit

PLIST_FILES=	bin/bjam

EXTRACT_AFTER_ARGS=	${DISTNAME}/tools/build/src/engine
MAKE_CMD=	./build.sh
ALL_TARGET=	cc ${WITH_DEBUG:D--debug}
MAKE_FLAGS=	#
_MAKE_JOBS=	#
MAKEFILE=	#

.include "${.CURDIR}/../boost-all/common.mk"

do-build:
	cd ${WRKSRC}/tools/build/src/engine && \
		${MAKE_ENV} ./build.sh cc

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/tools/build/src/engine/bin.*/bjam \
		${STAGEDIR}${PREFIX}/bin/

.include <bsd.port.mk>
