PORTNAME=	wurlitzer
DISTVERSION=	3.1.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Capture C-level output in Python context managers
WWW=		https://github.com/minrk/wurlitzer

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.5+
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

do-test:
	cd ${WRKDIR} && ${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
		${PYTHON_CMD} -m pytest --import-mode=importlib -v ${WRKSRC}/test.py

.include <bsd.port.mk>
