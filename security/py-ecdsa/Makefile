PORTNAME=	ecdsa
PORTVERSION=	0.19.2
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ECDSA cryptographic signature library (pure python)
WWW=		https://github.com/tlsfuzzer/python-ecdsa

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=1.9.0:devel/py-six@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coverage>=0:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>=0:devel/py-hypothesis@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

OPTIONS_RADIO=	FASTER
OPTIONS_RADIO_FASTER=	GMPY GMPY2
OPTIONS_DEFAULT=GMPY2
GMPY_DESC=	GMPY support
GMPY2_DESC=	GMPY2 support

GMPY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gmpy>=0:math/py-gmpy@${PY_FLAVOR}
GMPY2_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gmpy2>=0:math/py-gmpy2@${PY_FLAVOR}

do-test:
	@cd ${WRKDIR} && ${SETENV} ${TEST_ENV} HOME=${WRKDIR} PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${PYTHONPATH} \
		${PYTHON_CMD} -m coverage run --branch -m pytest -rs ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/ecdsa

.include <bsd.port.mk>
