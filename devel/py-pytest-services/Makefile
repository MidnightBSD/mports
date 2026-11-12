PORTNAME=	pytest-services
DISTVERSION=	2.2.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fixtures and utility functions to run service processes for pytest
WWW=		https://github.com/pytest-dev/pytest-services

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm8>=8.1.0<9:devel/py-setuptools-scm8@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}psutil>0:sysutils/py-psutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}zclockfile>=2.0:devel/py-zclockfile@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist pep517

_PYTEST_SERVICES_SCM_PATH?=	${PYTHON_LIBDIR}/mports-setuptools-scm/8
MAKE_ENV+=	PYTHONPATH=${_PYTEST_SERVICES_SCM_PATH}

NO_ARCH=	yes

.include <bsd.port.mk>
