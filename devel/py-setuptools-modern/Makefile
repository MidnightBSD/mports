PORTNAME=	setuptools
DISTVERSION=	84.2.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	-modern
DIST_SUBDIR=	python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Private setuptools 84.2.1 build backend
WWW=		https://setuptools.pypa.io/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}build>=1.0.3:devel/py-build@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}installer>=0.7:devel/py-installer@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	allflavors flavors
NO_ARCH=	yes

_SETUPTOOLS_SLOT=	modern
_PRIVATE_DIR=	${PYTHONPREFIX_LIBDIR}/mports-setuptools/${_SETUPTOOLS_SLOT}
_BOOTSTRAP_PYTHON=	${WRKDIR}/bootstrap/bin/${PYTHON_VERSION}

# Upstream bootstraps itself with backend-path=["."] and requires=[].
do-build:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} -S -m venv --without-pip ${WRKDIR}/bootstrap
	cd ${BUILD_WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} PYTHONPATH=${PYTHON_SITELIBDIR} \
		${_BOOTSTRAP_PYTHON} -m build --no-isolation --wheel

do-install:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} ${FILESDIR}/install-private.py \
		--destdir ${FAKE_DESTDIR:Q} --prefix ${TRUE_PREFIX:Q} \
		--private-dir ${_PRIVATE_DIR:Q} \
		${BUILD_WRKSRC}/dist/setuptools-${DISTVERSION}-py3-none-any.whl

do-test:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${_BOOTSTRAP_PYTHON} ${FILESDIR}/test-provider.py \
		${FAKE_DESTDIR}${_PRIVATE_DIR} ${PYTHON_SITELIBDIR} \
		${DISTVERSION} ${WRKDIR}/provider-test ${PYTHON_CMD}

.include <bsd.port.mk>
