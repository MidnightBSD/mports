# $MidnightBSD$

PORTNAME=	gdata
PORTVERSION=	2.0.18
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GData Python Client Library

LICENSE=	apache2

USES=		python:2.7
USE_PYTHON=	autoplist distutils

OPTIONS_DEFINE=	GMPY M2CRYPTO PYCRYPTO EXAMPLES

# optional modules (see src/gdata/tlslite/utils/cryptomath.py)
GMPY_DESC=	Multiprecision arithmetic
M2CRYPTO_DESC=	Cryptography and SSL toolkit
PYCRYPTO_DESC=	Cryptography toolkit

OPTIONSFILE?=	${PORT_DBDIR}/py-${PORTNAME}/options

EXAMPLESDIR=	${PREFIX}/share/examples/py-${PORTNAME}

M2CRYPTO_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}m2crypto>=0.20:security/py-m2crypto@${PY_FLAVOR}
PYCRYPTO_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pycrypto>0:security/py-pycrypto@${PY_FLAVOR}
GMPY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gmpy>0:math/py-gmpy@${PY_FLAVOR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/
	@cd ${WRKSRC}/samples && \
		${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
