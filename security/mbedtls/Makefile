PORTNAME=	mbedtls
PORTVERSION=	2.16.11
DISTVERSIONPREFIX=${PORTNAME}-
CATEGORIES=	security devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SSL/TLS and cryptography library

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/apache-2.0.txt

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	ARMmbed

ALL_TARGET=	no_test
MAKE_ENV=	SHARED=1
USES=		gmake tar:tgz
USE_LDCONFIG=	yes

CONFLICTS_INSTALL=	polarssl13-[0-9]*

# magus
NO_TEST=	yes

post-patch:
	@${RM} ${WRKSRC}/include/mbedtls/*.orig
	@${REINPLACE_CMD} \
		-e 's/PREFIX/NAMEPREFIX/' \
		-e 's/$$(DESTDIR)/&$$(PREFIX)/' \
		${WRKSRC}/Makefile
	@${REINPLACE_CMD} 's/-fpic//' ${WRKSRC}/library/Makefile

post-install:
	${FIND} ${PREFIX}/bin -type f -not -name \
		mbedtls_udp_proxy_wrapper.sh -exec ${STRIP_CMD} {} +
	${STRIP_CMD} ${PREFIX}/lib/*.so

.include <bsd.port.mk>
