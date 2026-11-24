PORTNAME=	scipy
DISTVERSION=	1.17.1
PORTEPOCH=	1
CATEGORIES=	science python
MASTER_SITES=	https://docs.scipy.org/doc/scipy-1.17.0/:doc \
		PYPI:source \
		SF:source
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:source \
		scipy-html-1.17.0.zip:doc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scientific tools for Python
WWW=		https://www.scipy.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}meson-python>=0.15.0:devel/meson-python@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pybind11>=2.13.2:devel/py-pybind11@${PY_FLAVOR} \
		pybind11>=2.13.6_2:devel/pybind11 \
		${PYTHON_PKGNAMEPREFIX}pythran>=0.14.0:devel/py-pythran@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cython32>=3.2.0:lang/cython32@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy>=1.26.4:math/py-numpy@${PY_FLAVOR}
LIB_DEPENDS=	libqhull_r.so:math/qhull
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.26.4:math/py-numpy@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-cov>0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-timeout>0:devel/py-pytest-timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>0:devel/py-pytest-xdist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mpmath>0:math/py-mpmath@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}gmpy2>0:math/py-gmpy2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}threadpoolctl>0:devel/py-threadpoolctl@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}scikit-umfpack>0:math/py-scikit-umfpack@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pooch>0:devel/py-pooch@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>=6.30:devel/py-hypothesis@${PY_FLAVOR}

USES=		blaslapack:openblas compiler:c++17-lang cpe fortran pkgconfig python:3.11+ shebangfix
USE_PYTHON=	autoplist concurrent pep517 pytest

CYTHON32_DIR?=	${PYTHONPREFIX_LIBDIR}/mports-cython/32
MAKE_ENV+=	PYTHONPATH=${CYTHON32_DIR}

PEP517_BUILD_CONFIG_SETTING=	-Csetup-args=-Duse-system-libraries=qhull \
				-Csetup-args=-Dblas=openblas \
				-Csetup-args=-Dlapack=openblas

TEST_WRKSRC=	${WRKDIR}
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_ARGS=	--pyargs scipy
PYTEST_BROKEN_TESTS=	test_threading

BINARY_ALIAS=	cython=${CYTHON32_DIR}/bin/cython \
		f2py=f2py-${PYTHON_VER} \
		pybind11-config=pybind11-config-${PYTHON_VER} \
		pythran=pythran-${PYTHON_VER}

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} \
		-e 's|meson-python>=0.15.0,<0.21.0|meson-python>=0.15.0|' \
		-e 's|pybind11>=2.13.2,<3.1.0|pybind11>=2.13.2|g' \
		-e 's|pythran>=0.14.0,<0.19.0|pythran>=0.14.0|' \
		-e 's|numpy>=2.0.0|numpy>=1.26.4|g' \
		${WRKSRC}/pyproject.toml

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' | ${XARGS} ${STRIP_CMD}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	@${UNZIP_CMD} -d ${FAKE_DESTDIR}${DOCSDIR} ${DISTDIR}/scipy-html-1.17.0.zip
	@${RM} ${FAKE_DESTDIR}${DOCSDIR}/.buildinfo

.include <bsd.port.mk>
