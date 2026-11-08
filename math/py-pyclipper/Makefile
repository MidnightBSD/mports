PORTNAME=	pyclipper
PORTVERSION=	1.4.0
CATEGORIES=	math python
MASTER_SITES=	PYPI/source/p/pyclipper
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cython wrapper for the C++ translation of Clipper library
WWW=		https://github.com/fonttools/pyclipper

LICENSE=	mit BSL-1.0
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=1.11.1:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	pep517 cython autoplist pytest

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sympy>=0:math/py-sympy@${PY_FLAVOR}

TEST_ARGS=	-ra
TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/pyclipper/_pyclipper${PYTHON_TAG}.so

.include <bsd.port.mk>
