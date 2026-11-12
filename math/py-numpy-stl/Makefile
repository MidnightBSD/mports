PORTNAME=	numpy-stl
DISTVERSION=	4.0.1
CATEGORIES=	math python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	numpy_stl-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple library to make working with STL files fast and easy
WWW=		https://github.com/WoLpH/numpy-stl

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}uv-build011>=0.11.0<0.12:devel/py-uv-build011@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.24,1:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-utils>=3.4.5:misc/py-python-utils@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.1:devel/py-typing-extensions@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=9.0,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=7.0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}coverage>=7.0:devel/py-coverage@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist pep517 pytest

NO_ARCH=	yes

_UV_BUILD_PRIVATE?=	${PYTHONPREFIX_LIBDIR}/mports-uv-build/011
MAKE_ENV+=	PYTHONPATH=${_UV_BUILD_PRIVATE} PATH=${_UV_BUILD_PRIVATE}/bin:${PATH}

# Keep the build backend path from overriding staged imports during tests.
TEST_ENV=	${MAKE_ENV:NPYTHONPATH=*}

.include <bsd.port.mk>
