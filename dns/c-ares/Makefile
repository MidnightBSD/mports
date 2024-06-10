PORTNAME=	c-ares
DISTVERSION=	1.28.1
CATEGORIES=	dns
MASTER_SITES=	https://github.com/${PORTNAME}/${PORTNAME}/releases/download/cares-${DISTVERSION:S/./_/g}/ \
		https://c-ares.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Asynchronous DNS resolver library
WWW=		https://c-ares.haxx.se/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

USES=		cmake pathfix
USE_LDCONFIG=	yes

CONFLICTS=	py*-ripe.atlas.tools

CMAKE_ARGS=		-DCMAKE_INSTALL_MANDIR:PATH=${MANPREFIX}/man

OPTIONS_DEFINE=		STATIC TEST
OPTIONS_SUB=	yes

STATIC_CMAKE_BOOL=	CARES_STATIC

TEST_BUILD_DEPENDS=	googletest>0:devel/googletest
TEST_USES=		compiler:c++14-lang localbase:ldflags
TEST_USES_OFF=		compiler:c++11-lang
TEST_CMAKE_BOOL=	CARES_BUILD_TESTS
TEST_TEST_TARGET=	test

post-patch:
	@${REINPLACE_CMD} -e 's|ares-test-live.cc||g' \
		${PATCH_WRKSRC}/test/Makefile.inc

post-install-STATIC-on:
	@${RLN} libcares_static.a ${FAKE_DESTDIR}/${PREFIX}/lib/libcares.a

.include <bsd.port.mk>
