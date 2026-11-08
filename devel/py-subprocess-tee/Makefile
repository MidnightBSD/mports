PORTNAME=	subprocess-tee
PORTVERSION=	0.4.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Captures output while still printing it in real-time
WWW=		https://github.com/pycontribs/subprocess-tee

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=7.0.0:devel/py-setuptools-scm@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}enrich>=1.2.6:textproc/py-enrich@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}molecule>=3.4.0:devel/py-molecule@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=2.12.1:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-plus>=0.2:devel/py-pytest-plus@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=2.3.0,1:devel/py-pytest-xdist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=6.2.5,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
TEST_ENV=	SHELL=/bin/sh
PYTHON_TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${WRKSRC}

do-test:
	cd ${WRKSRC} && ${SETENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
		${PYTHON_CMD} -m pytest -v -rs

.include <bsd.port.mk>
