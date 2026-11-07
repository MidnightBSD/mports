PORTNAME=	process-tests
DISTVERSION=	3.0.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools for testing processes
WWW=		https://github.com/ionelmc/python-process-tests

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.8+
USE_PYTHON=	distutils autoplist pytest

BINARY_ALIAS=	python=${PYTHON_CMD} # for tests

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} PYTHONUNBUFFERED=yes

NO_ARCH=	yes

.include <bsd.port.mk>
