PORTNAME=	mscript
DISTVERSIONPREFIX=	v
DISTVERSION=	0.2
CATEGORIES=	lang

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VBScript-compatible interpreter
WWW=		https://github.com/laffer1/mscript

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler:c++23-lang
USE_GITHUB=	yes
GH_ACCOUNT=	laffer1

ALL_TARGET=	mscript
TEST_TARGET=	test
MAKE_ARGS=	CXX="${CXX}" CXXFLAGS="${CXXFLAGS} -std=c++23" \
		LDLIBS="${LDFLAGS} -lbsdxml -lsqlite3 -lfetch"

PLIST_FILES=	bin/mscript share/man/man1/mscript.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mscript ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/mscript.1 ${PREFIX}/share/man/man1

.include <bsd.port.mk>
