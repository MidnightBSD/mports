PORTNAME=	sphinx-autoapi
DISTVERSION=	3.8.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	sphinx_autoapi-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx API documentation generator
WWW=		https://sphinx-autoapi.readthedocs.io/en/latest/ \
		https://github.com/readthedocs/sphinx-autoapi

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.2<4:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}astroid>=3.0:devel/py-astroid@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>=0:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx>=7.4.0,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

# Restore test fixtures omitted from the PyPI sdist (upstream v3.8.0).
post-extract:
	${LN} -s ../pyexample/example ${WRKSRC}/tests/python/pymovedconfpy/example
	${LN} -s ../example_2 ${WRKSRC}/tests/toctreeexample/example/example_2

.include <bsd.port.mk>
