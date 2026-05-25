PORTNAME=	easyexif
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tiny ISO-compliant C++ EXIF parsing library
WWW=		https://github.com/mayanklahiri/easyexif

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler:c++11-lib shebangfix
USE_GITHUB=	yes
GH_ACCOUNT=	mayanklahiri

SHEBANG_FILES=	test.sh

NO_TEST=	yes

PLIST_FILES=	easyexif/bin/demo \
		easyexif/src/demo.cpp \
		easyexif/src/exif.cpp \
		include/exif.h

do-install:
	@${MKDIR} ${PREFIX}/include
	${CP} ${WRKSRC}/*.h ${PREFIX}/include
	@${MKDIR} ${PREFIX}/${PORTNAME}/src
	${CP} ${WRKSRC}/*.cpp ${PREFIX}/${PORTNAME}/src
	@${MKDIR} ${PREFIX}/${PORTNAME}/bin
	${STRIP_CMD} ${WRKSRC}/demo
	${CP} ${WRKSRC}/demo ${PREFIX}/${PORTNAME}/bin

.include <bsd.port.mk>
