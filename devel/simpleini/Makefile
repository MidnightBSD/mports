PORTNAME=	simpleini
PORTVERSION=	4.19
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ library providing a simple API to INI-style configuration files
WWW=		https://github.com/brofield/simpleini

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENCE.txt

USE_GITHUB=	yes
GH_ACCOUNT=	brofield
NO_BUILD=	yes
NO_ARCH=	yes

PORTDOCS=	*

PLIST_FILES=	include/SimpleIni.h

OPTIONS_DEFINE=	TEST DOCS

TEST_USES=	pkgconfig
TEST_BUILD_DEPENDS=	googletest>=0:devel/googletest

do-install:
	${INSTALL_DATA} ${WRKSRC}/SimpleIni.h ${PREFIX}/include

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}/

do-test-TEST-on:
	cd ${WRKSRC}/tests && ${SETENV} ${MAKE_ENV} ${TEST_ENV} \
		${MAKE_CMD} ${_MAKE_JOBS} ${MAKE_ARGS} test

.include <bsd.port.mk>
