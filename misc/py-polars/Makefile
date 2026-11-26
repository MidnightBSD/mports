PORTNAME=	polars
DISTVERSIONPREFIX=	py-
DISTVERSION=	2.1.0
CATEGORIES=	misc
#MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Blazingly fast DataFrame library
WWW=		https://github.com/pola-rs/polars

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/../LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
.for runtime in compat 32 64 # same as flavors in misc/py-polars-runtime
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}polars-runtime-${runtime}>=${DISTVERSION}:misc/py-polars-runtime@${PY_FLAVOR}_${runtime} \
		${PYTHON_PKGNAMEPREFIX}polars-runtime-${runtime}<${_POLARS_RUNTIME_NEXT_VERSION}:misc/py-polars-runtime@${PY_FLAVOR}_${runtime}
.endfor
# optional dependencies
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}altair>=5.4.0:graphics/py-altair@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cloudpickle>0:devel/py-cloudpickle@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}gevent>0:devel/py-gevent@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}great-tables>=0.8.0:devel/py-great-tables@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}matplotlib>0:math/py-matplotlib@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	pep517 autoplist pytest

USE_GITHUB=	yes
GH_ACCOUNT=	pola-rs

WRKSRC_SUBDIR=	py-polars

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_WRKSRC=	${WRKSRC}/tests

BINARY_ALIAS=	python3=${PYTHON_CMD}

NO_ARCH=	yes

.include <bsd.port.pre.mk>

# The Rust runtime must exactly match the Python frontend. Keep the two
# bounds separate because stable/4.0 package metadata stores only one bound.
_POLARS_RUNTIME_NEXT_VERSION=	2.1.1

.include <bsd.port.post.mk>
