PORTNAME=	cython
DISTVERSION=	3.2.0
CATEGORIES=	lang python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	32

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Private Cython 3.2 compiler for constrained build dependencies
WWW=		https://cython.org/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}build>=1.0.3:devel/py-build@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}installer>=0.7:devel/py-installer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		compiler:c11 python:3.8+
USE_PYTHON=	allflavors flavors
_PRIVATE_DIR=	${PYTHONPREFIX_LIBDIR}/mports-cython/32

do-build:
	cd ${BUILD_WRKSRC} && ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} -m build --no-isolation --wheel

do-install:
	${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${FILESDIR}/install-private.py \
		--destdir ${FAKE_DESTDIR:Q} --prefix ${TRUE_PREFIX:Q} \
		--private-dir ${_PRIVATE_DIR:Q} ${BUILD_WRKSRC}/dist/Cython-${DISTVERSION}-*.whl

post-install:
	${FIND} ${FAKE_DESTDIR}${_PRIVATE_DIR} -name '*.so' -exec ${STRIP_CMD} {} +

do-test:
	${SETENV} ${TEST_ENV} PYTHONPATH=${FAKE_DESTDIR}${_PRIVATE_DIR} \
		${PYTHON_CMD} ${FILESDIR}/test-provider.py ${WRKDIR}/provider-test

.include <bsd.port.mk>
