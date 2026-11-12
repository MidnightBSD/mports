PORTNAME=	gmpy2
DISTVERSION=	2.3.2
CATEGORIES=	math python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GMP/MPIR, MPFR, and MPC interface to Python
WWW=		https://gmpy2.readthedocs.io/en/latest/

LICENSE=	lgpl3+
LICENSE_FILE=	${WRKSRC}/COPYING.LESSER

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=6.0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libgmp.so:math/gmp \
		libmpc.so:math/mpc \
		libmpfr.so:math/mpfr
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cython>=0:lang/cython@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>0:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mpmath>=0:math/py-mpmath@${PY_FLAVOR}

USES=		localbase:ldflags python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist pep517 pytest

MAKE_ENV=	SETUPTOOLS_SCM_PRETEND_VERSION=${DISTVERSION}

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/gmpy2/gmpy2*.so

do-test:
	@cd ${WRKDIR} && ${SETENV} ${TEST_ENV} HOME=${WRKDIR} PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${PYTHONPATH} \
		${PYTHON_CMD} -m pytest ${WRKSRC}/test
	@cd ${WRKDIR} && ${SETENV} ${TEST_ENV} HOME=${WRKDIR} PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${PYTHONPATH} \
		${PYTHON_CMD} ${WRKSRC}/test_cython/runtests.py

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} >= 31100 && ${PYTHON_REL} < 31500
TEST_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}numpy>=0:math/py-numpy@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
