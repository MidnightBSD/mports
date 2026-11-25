PORTNAME=	optree
PORTVERSION=	0.20.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Optimized PyTree utilities
WWW=		https://github.com/metaopt/optree

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pybind11>=2.12:devel/py-pybind11@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=61:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.14.0:devel/py-typing-extensions@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}attrs>=26.1.0:devel/py-attrs@${PY_FLAVOR} \
		${PYNUMPY}

USES=		cmake:indirect compiler:c++20-lang python
USE_PYTHON=	autoplist concurrent pep517 pytest

MAKE_ENV=	CMAKE_BUILD_PARALLEL_LEVEL=${MAKE_JOBS_NUMBER}
# The upstream subprocess test strips PYTHONPATH, so its patch retains the staged path.
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_WRKSRC=	${WRKDIR}
TEST_ARGS=	--no-cov ${WRKSRC}/tests

OPTIONS_DEFINE=	ATTRS NUMPY
ATTRS_DESC=	Attrs integration

ATTRS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}attrs>=0:devel/py-attrs@${PY_FLAVOR}
NUMPY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=0,1:math/py-numpy@${PY_FLAVOR}

.include <bsd.port.pre.mk>

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.post.mk>
