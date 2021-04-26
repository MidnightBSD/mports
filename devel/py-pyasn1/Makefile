# Created by: Martin Jackson <mhjacks@swbell.net>

PORTNAME=	pyasn1
PORTVERSION=	0.4.7
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ASN.1 toolkit for Python

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

NO_ARCH=	yes
USES=		python:3.6+
USE_PYTHON=	autoplist distutils

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.mk>
