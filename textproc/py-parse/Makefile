PORTNAME=	parse
PORTVERSION=	1.22.2
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Opposite of format()
WWW=		https://github.com/r1chardj0n3s/parse

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-cov>0:devel/py-pytest-cov@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_ARGS=	--cov=parse --cov-report=term-missing --cov-append --cov-branch \
		--doctest-modules --doctest-glob=README.rst

NO_ARCH=	yes

.include <bsd.port.mk>
