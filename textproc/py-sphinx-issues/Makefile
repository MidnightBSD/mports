PORTNAME=	sphinx-issues
PORTVERSION=	6.0.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx extension for linking to your project's issue tracker
WWW=		https://github.com/sloria/sphinx-issues

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core<4:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=8.1.0,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist pep517 pytest

# Sphinx 9 requires Python 3.11; test the staged extension.
PYTHON_TEST_ENV?=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_ENV+=	PYTHONDONTWRITEBYTECODE=1
TEST_ARGS=	--import-mode=importlib

NO_ARCH=	yes

.include <bsd.port.mk>
