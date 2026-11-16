PORTNAME=	mpmath
PORTVERSION=	1.4.1
CATEGORIES=	math python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Library for Arbitrary-precision Floating-point Arithmetic
WWW=		https://www.mpmath.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gmpy2>=2.3:math/py-gmpy2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gmpy2>=2.3:math/py-gmpy2@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>0:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-timeout>0:devel/py-pytest-timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}matplotlib>0:math/py-matplotlib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pexpect>0:misc/py-pexpect@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ipython>0:devel/ipython@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>0:devel/py-hypothesis@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist pep517 pytest

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest

.include <bsd.port.mk>
