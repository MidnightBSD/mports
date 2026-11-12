PORTNAME=	pybind11
DISTVERSION=	3.1.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Seamless interoperability between C++11 and Python
WWW=		https://pybind11.readthedocs.io/en/stable/ \
		https://github.com/pybind/pybind11

LICENSE=	bsd3

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}scikit-build-core>=0.11.2:devel/py-scikit-build-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		cmake:indirect python
USE_PYTHON=	pep517 concurrent autoplist pytest

NO_ARCH=	yes
NO_TEST=	yes

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=7,1:devel/py-pytest@${PY_FLAVOR} \
		cmake:devel/cmake

TEST_ENV=	${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${WRKSRC}/build/tests

.include <bsd.port.mk>
