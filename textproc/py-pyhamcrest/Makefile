# Created by: Richard Gallamore <ultima@FreeBSD.org>

PORTNAME=	PyHamcrest
DISTVERSIONPREFIX=	V
DISTVERSION=	2.0.3
CATEGORIES=	textproc python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hamcrest matchers for Python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=40.6.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=0:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mypy-plugins>=4.0.3:devel/py-pytest-mypy-plugins@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}types-mock>=0:devel/py-types-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>=1.11:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=5.0,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mock>=0:devel/py-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR}

USES=		python:3.5+
USE_PYTHON=	autoplist distutils
USE_GITHUB=	yes
GH_ACCOUNT=	hamcrest

NO_ARCH=	yes
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		MYPYPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

do-test:
	cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest -p pytest-mypy-plugins

.include <bsd.port.mk>
