PORTNAME=	jaraco.packaging
PORTVERSION=	10.4.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	jaraco_packaging-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools to supplement packaging Python releases
WWW=		https://github.com/jaraco/jaraco.packaging

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coherent.licensed>=0:devel/py-coherent.licensed@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=3.4.1:devel/py-setuptools-scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}build>=0:devel/py-build@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}domdf-python-tools>=0:devel/py-domdf-python-tools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jaraco.context>=0:devel/py-jaraco.context@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx>=0,1:textproc/py-sphinx@${PY_FLAVOR}
# build[virtualenv]
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}virtualenv>=20.0.35:devel/py-virtualenv@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=6,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}types-docutils>=0:devel/py-types-docutils@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517
PEP517_WHEEL_DISTNAME=	${PORTNAME:S|.|_|g}

NO_ARCH=	yes

PYTHON_TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${TEST_WRKSRC}

do-test:
	cd ${TEST_WRKSRC} && ${SETENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
		${PYTHON_CMD} -m pytest -v -rs

.include <bsd.port.mk>
