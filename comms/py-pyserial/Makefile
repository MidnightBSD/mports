# Created by: Hye-Shik Chang <perky@fallin.lv>

PORTNAME=	pyserial
PORTVERSION=	3.5
CATEGORIES=	comms python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Serial port encapsulation library for Python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		python

USE_PYTHON=	distutils autoplist

NO_ARCH=	yes

do-test:
	${SETENV} PYTHONPATH=${STAGEDIR}${PYTHONPREFIX_SITELIBDIR} ${PYTHON_CMD} ${WRKSRC}/test/test.py

.include <bsd.port.mk>
