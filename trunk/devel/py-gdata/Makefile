# $MidnightBSD$

PORTNAME=	gdata
PORTVERSION=	2.0.18
CATEGORIES=	devel python
MASTER_SITES=	GOOGLE_CODE
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GData Python Client Library

LICENSE=	apache2

PROJECTHOST=	gdata-python-client
USES=	python:2
USE_PYTHON=	distutils

OPTIONS_DEFINE=	GMPY M2CRYPTO PYCRYPTO EXAMPLES

# optional modules (see src/gdata/tlslite/utils/cryptomath.py)
GMPY_DESC=	Multiprecision arithmetic
M2CRYPTO_DESC=	Cryptography and SSL toolkit
PYCRYPTO_DESC=	Cryptography toolkit

OPTIONSFILE?=	${PORT_DBDIR}/py-${PORTNAME}/options

EXAMPLESDIR=	${PREFIX}/share/examples/py-${PORTNAME}

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MM2CRYPTO}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}m2crypto>=0.20:${PORTSDIR}/security/py-m2crypto
.endif
.if ${PORT_OPTIONS:MPYCRYPTO}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}pycrypto>0:${PORTSDIR}/security/py-pycrypto
.endif
.if ${PORT_OPTIONS:MGMPY}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}gmpy>0:${PORTSDIR}/math/py-gmpy
.endif

post-install:
.if ${PORT_OPTIONS:MEXAMPLES}
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}/
	@cd ${WRKSRC}/samples && \
		${COPYTREE_SHARE} . ${STAGEDIR}${EXAMPLESDIR}
.endif

.include <bsd.port.mk>
