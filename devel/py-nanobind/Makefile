PORTNAME=	nanobind
DISTVERSIONPREFIX=	v
DISTVERSION=	3.1.0
CATEGORIES=	devel python
#MASTER_SITES=	PYPI # no tarball
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tiny and efficient C++/Python bindings
WWW=		https://github.com/wjakob/nanobind

LICENSE=	bsd3 mit
LICENSE_COMB=	multi
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE
LICENSE_FILE_mit=	${WRKSRC}/ext/robin_map/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}scikit-build-core>=0.10:devel/py-scikit-build-core@${PY_FLAVOR} \
		cmake:devel/cmake-core
TEST_DEPENDS=	cmake:devel/cmake-core \
		eigen>=3.3.1:math/eigen3 \
		${PYNUMPY}

USES=		python:3.10+
USE_PYTHON=	autoplist pep517 pytest

USE_GITHUB=	yes
GH_ACCOUNT=	wjakob
GH_TUPLE=	Tessil:robin-map:188c455:robin_map/ext/robin_map

TEST_WRKSRC=	${BUILD_WRKSRC}/tests
TEST_ENV=	${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

NO_ARCH=	yes

post-patch:
	@${FIND} ${WRKSRC} -name '*.orig' -delete

pre-test: # build test extensions
	@cd ${WRKSRC} && \
		${SETENV} ${MAKE_ENV} cmake -DPython_EXECUTABLE=${PYTHON_CMD} . && \
		${SETENV} ${MAKE_ENV} cmake --build . --parallel ${MAKE_JOBS_NUMBER}

# tests as of 2.12.0:
# Results (46.91s):
#          2 failed
#       1495 passed
#         19 skipped
#          2 warnings

PATCH_SITES=	https://github.com/${GH_ACCOUNT}/${GH_PROJECT}/commit/

PATCHFILES+=	942e75d927e3884e56d607e77c026bb4a72a4763.patch:-p1

.include <bsd.port.mk>
