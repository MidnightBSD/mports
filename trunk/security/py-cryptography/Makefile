# $MidnightBSD$

PORTNAME=	cryptography
PORTVERSION=	2.1.4
PORTREVISION=	1
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cryptographic recipes and primitives for Python developers

LICENSE=		apache2 bsd3
LICENSE_COMB=		dual
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE.APACHE
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE.BSD

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.7:devel/py-cffi
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=1.4.1:devel/py-six \
		${PYTHON_PKGNAMEPREFIX}asn1crypto>=0.21.0:devel/py-asn1crypto \
		${PYTHON_PKGNAMEPREFIX}cffi>=1.7:devel/py-cffi \
		${PY_ENUM34} ${PY_IPADDRESS} \
		${PYTHON_PKGNAMEPREFIX}idna>=2.1:dns/py-idna
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=2.9.0:devel/py-pytest \
		${PYTHON_PKGNAMEPREFIX}iso8601>0:devel/py-iso8601

# Python 2.7, 3.4-3.6
USES=		compiler:env python ssl
USE_PYTHON=	autoplist concurrent distutils

CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}

.include <bsd.port.pre.mk>

.if ${CHOSEN_COMPILER_TYPE} == gcc && ${COMPILER_VERSION} <= 42
post-patch:
	@${REINPLACE_CMD} -e 's|"-Wno-error=sign-conversion"||' \
		${WRKSRC}/src/_cffi_src/build_openssl.py
.endif

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/cryptography/hazmat/bindings/*.so

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.post.mk>
