PORTNAME=	license-expression
DISTVERSION=	30.4.4
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	license_expression-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parses, normalizes and compares license expressions
WWW=		https://github.com/aboutcode-org/license-expression

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/NOTICE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=6:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}boolean.py>=4.0:devel/py-boolean.py@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist pep517 pytest

TEST_ARGS=	-rfExXw --strict-markers --doctest-modules

NO_ARCH=	yes

.include <bsd.port.mk>
