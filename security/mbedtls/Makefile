PORTNAME=	mbedtls
PORTVERSION=	2.28.6
DISTVERSIONPREFIX=${PORTNAME}-
CATEGORIES=	security devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SSL/TLS and cryptography library
WWW=		https://www.trustedfirmware.org/projects/mbed-tls/

LICENSE=	Apache-2.0 gpl2+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix
NO_TEST=	yes

USES=		gmake python:test shebangfix
SHEBANG_FILES=	scripts/*.py tests/scripts/*.py

USE_GITHUB=	yes
GH_ACCOUNT=	Mbed-TLS

ALL_TARGET=	no_test
TEST_TARGET=	test
MAKE_ENV=	PYTHON=${PYTHON_CMD} SHARED=1
USE_LDCONFIG=	yes

PORTSCOUT=	limit:^${PORTVERSION:R:S/./\./g}\.

post-patch:
	@${RM} ${WRKSRC}/include/mbedtls/*.orig
	@${REINPLACE_CMD} \
		-e 's/PREFIX/NAMEPREFIX/' \
		-e 's/$$(DESTDIR)/&$$(PREFIX)/' \
		${WRKSRC}/Makefile
	@${REINPLACE_CMD} 's/-fpic//' ${WRKSRC}/library/Makefile

post-install:
	${FIND} ${PREFIX}/bin -type f -not -name \*.sh \
		-exec ${STRIP_CMD} {} +
	${STRIP_CMD} ${PREFIX}/lib/*.so

.include <bsd.port.mk>
