# $MidnightBSD: mports/devel/py-gdata/Makefile,v 1.2 2009/12/29 02:47:21 laffer1 Exp $

PORTNAME=	gdata
PORTVERSION=	2.0.18
CATEGORIES=	devel python
MASTER_SITES=	GOOGLE_CODE
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GData Python Client Library
LICENSE=	apache2

PROJECTHOST=	gdata-python-client
USE_PYTHON=	-2.7
USE_PYDISTUTILS=	yes

OPTIONS_DEFINE=	GMPY M2CRYPTO PYCRYPTO

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
	${MKDIR} ${EXAMPLESDIR}/
	${CP} -R ${WRKSRC}/samples/ ${EXAMPLESDIR}/
.endif

.include <bsd.port.mk>
