PORTNAME=	scikit-learn
DISTVERSION=	1.9.1
CATEGORIES=	science python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	scikit_learn-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Machine learning algorithms for python
WWW=		https://scikit-learn.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}joblib>=1.4.0:devel/py-joblib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}narwhals>=2.0.1:math/py-narwhals@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}scipy>=1.10.0:science/py-scipy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}threadpoolctl>=3.5.0:devel/py-threadpoolctl@${PY_FLAVOR}
RUN_DEPENDS:=	${BUILD_DEPENDS}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}numpy>=1.24.1:math/py-numpy@${PY_FLAVOR}
BUILD_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}meson-python>=0.17.1:devel/meson-python@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cython32>=3.2.0:lang/cython32@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy>=2:math/py-numpy@${PY_FLAVOR}

USES=		fortran python:3.11+ localbase shebangfix
USE_PYTHON=	autoplist pep517 pytest

CYTHON32_DIR?=	${PYTHONPREFIX_LIBDIR}/mports-cython/32
MAKE_ENV+=	PYTHONPATH=${CYTHON32_DIR}

TEST_ARGS=	sklearn
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_WRKSRC=	${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

SHEBANG_FILES=	sklearn/_build_utils/version.py
BINARY_ALIAS=	cython=${CYTHON32_DIR}/bin/cython

post-install: # strip binaries
	@${STRIP_CMD} \
		${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/sklearn/*.cpython*.so \
		${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/sklearn/*/*.cpython*.so \
		${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/sklearn/*/*/*.cpython*.so

.include <bsd.port.mk>
