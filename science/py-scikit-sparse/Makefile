PORTNAME=	scikit-sparse
DISTVERSIONPREFIX=	v
DISTVERSION=	0.5.0
CATEGORIES=	science python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sparse matrix package
WWW=		https://github.com/scikit-sparse/scikit-sparse

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=2.0:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
BUILD_RUN_DEPENDS=	suitesparse-amd>=3.3.0:math/suitesparse-amd \
		suitesparse-btf>=2.3.0:math/suitesparse-btf \
		suitesparse-camd>=3.3.0:math/suitesparse-camd \
		suitesparse-ccolamd>=3.3.0:math/suitesparse-ccolamd \
		suitesparse-cholmod>=5.1.0:math/suitesparse-cholmod \
		suitesparse-colamd>=3.3.0:math/suitesparse-colamd \
		suitesparse-klu>=2.3.0:math/suitesparse-klu \
		suitesparse-spqr>=4.3.0:math/suitesparse-spqr \
		suitesparse-umfpack>=6.3.0:math/suitesparse-umfpack
LIB_DEPENDS=	libamd.so:math/suitesparse-amd \
		libbtf.so:math/suitesparse-btf \
		libcamd.so:math/suitesparse-camd \
		libccolamd.so:math/suitesparse-ccolamd \
		libcholmod.so:math/suitesparse-cholmod \
		libcolamd.so:math/suitesparse-colamd \
		libklu.so:math/suitesparse-klu \
		libspqr.so:math/suitesparse-spqr \
		libumfpack.so:math/suitesparse-umfpack
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>2.0:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}scipy>=1.14:science/py-scipy@${PY_FLAVOR}

USES=		fortran python:3.10+ python-setuptools:78
USE_PYTHON=	pep517 cython autoplist pytest
USE_GITHUB=	yes

MAKE_ENV=	SUITESPARSE_INCLUDE_DIR=${LOCALBASE}/include/suitesparse \
		SUITESPARSE_LIBRARY_DIR=${LOCALBASE}/lib

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_WRKSRC=	${WRKSRC}
TEST_ARGS=	-p no:cov -p no:xdist

post-install:
	@${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/sksparse -name "*.so" | ${XARGS} ${STRIP_CMD}

.include <bsd.port.mk>
