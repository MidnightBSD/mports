PORTNAME=	cmark
DISTVERSION=	0.30.3
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CommonMark parsing and rendering library and program in C
WWW=		https://github.com/commonmark/cmark

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake python:test
USE_GITHUB=	yes
GH_ACCOUNT=	commonmark
USE_LDCONFIG=	yes

CONFLICTS_INSTALL=	 py*-CommonMark # bin/cmark

CMAKE_ARGS=	-DCMAKE_INSTALL_LIBDIR:STRING="lib"
PLIST_SUB=	VERSION=${PORTVERSION}
TEST_TARGET=	test

.include <bsd.port.mk>
