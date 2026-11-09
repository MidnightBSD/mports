PORTNAME=	pyzmq
PORTVERSION=	27.2.0
CATEGORIES=	net devel
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for ZeroMQ
WWW=		https://pyzmq.readthedocs.io/en/latest/ \
		https://github.com/zeromq/pyzmq

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}scikit-build-core>=0.10:devel/py-scikit-build-core@${PY_FLAVOR}
LIB_DEPENDS=	libzmq.so:net/libzmq4
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-asyncio>=0.17:devel/py-pytest-asyncio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tornado>=0:www/py-tornado@${PY_FLAVOR}

USES=		cmake:indirect python:3.9+
USE_PYTHON=	autoplist concurrent cython pep517 pytest

_PYZMQ_ZMQ_PREFIX?=	${LOCALBASE}
MAKE_ENV+=	ZMQ_PREFIX=${_PYZMQ_ZMQ_PREFIX} PYZMQ_NO_BUNDLE=ON \
		PYZMQ_LIBZMQ_RPATH=OFF
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${TEST_WRKSRC}

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

do-test:
	cd ${TEST_WRKSRC} && ${SETENVI} ${WRK_ENV} ${TEST_ENV} ${PYTHON_CMD} -c 'import sys; sys.path.pop(0); import pytest; raise SystemExit(pytest.main(sys.argv[1:]))' ${TEST_ARGS:NDESTDIR=*}

.include <bsd.port.mk>
