# $MidnightBSD$

PORTNAME=	paramiko
PORTVERSION=	1.15.2
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python SSH2 protocol library

LICENSE=	gpl2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pycrypto>0:${PORTSDIR}/security/py-pycrypto \
		${PYTHON_PKGNAMEPREFIX}ecdsa>0:${PORTSDIR}/security/py-ecdsa

USES=		python
USE_PYTHON=	distutils autoplist

OPTIONS_DEFINE=	EXAMPLES

.include <bsd.mport.options.mk>

regression-test: extract
	@(cd ${WRKSRC} && ${PYTHON_CMD} test.py)

.include <bsd.port.mk>
