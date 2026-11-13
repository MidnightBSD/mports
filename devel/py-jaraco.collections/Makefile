PORTNAME=	jaraco.collections
DISTVERSION=	5.2.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S|.|_|}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python models and classes to supplement the stdlib ‘collections’
WWW=		https://github.com/jaraco/jaraco.collections

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coherent.licensed>=0:devel/py-coherent.licensed@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=3.4.1:devel/py-setuptools-scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}jaraco.text>=0:devel/py-jaraco.text@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist pep517 pytest
PEP517_WHEEL_DISTNAME=	${PORTNAME:S|.|_|g}

NO_ARCH=	yes

do-test:
	cd ${TEST_WRKSRC} && ${SETENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
		${PYTHON_CMD} -m pytest -v -rs

.include <bsd.port.mk>
