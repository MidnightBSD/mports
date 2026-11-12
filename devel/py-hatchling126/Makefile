PORTNAME=	hatchling
DISTVERSION=	1.26.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	126
DIST_SUBDIR=	python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Private Hatchling 1.26.3 build backend
WWW=		https://github.com/pypa/hatch/tree/master/backend

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}build>=1.0.3:devel/py-build@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}installer>=0.7:devel/py-installer@${PY_FLAVOR}
BUILD_RUN_DEPENDS=	${PY_TOMLI} \
		${PYTHON_PKGNAMEPREFIX}packaging>=24.2:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pathspec>=0.10.1:devel/py-pathspec@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pluggy>=1.0.0:devel/py-pluggy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}trove-classifiers>=0:devel/py-trove-classifiers@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	allflavors flavors
NO_ARCH=	yes

_PRIVATE_DIR=	${PYTHONPREFIX_LIBDIR}/mports-hatchling/126
_BOOTSTRAP_PYTHON=	${WRKDIR}/bootstrap/bin/${PYTHON_VERSION}

# Upstream bootstraps itself with backend-path=["src"] and requires=[].
do-build:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} -S -m venv --without-pip ${WRKDIR}/bootstrap
	cd ${BUILD_WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} PYTHONPATH=${PYTHON_SITELIBDIR} \
		${_BOOTSTRAP_PYTHON} -m build --no-isolation --wheel

do-install:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} ${FILESDIR}/install-private.py \
		--destdir ${FAKE_DESTDIR:Q} --prefix ${TRUE_PREFIX:Q} \
		--private-dir ${_PRIVATE_DIR:Q} \
		${BUILD_WRKSRC}/dist/hatchling-${DISTVERSION}-py3-none-any.whl

do-test:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${_BOOTSTRAP_PYTHON} ${FILESDIR}/test-provider.py \
		${FAKE_DESTDIR}${_PRIVATE_DIR} ${PYTHON_SITELIBDIR} \
		${DISTVERSION} ${WRKDIR}/provider-test ${PYTHON_CMD}

.include <bsd.port.mk>
