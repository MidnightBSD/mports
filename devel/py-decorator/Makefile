PORTNAME=	decorator
PORTVERSION=	5.3.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Better living through Python with decorators

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		cpe python:3.9+ python-setuptools:78
CPE_VENDOR=	python
USE_PYTHON=	autoplist concurrent pep517 unittest

NO_ARCH=	yes

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

TEST_ARGS=	discover -s tests

.include <bsd.port.mk>
