PORTNAME=	python-fcl
DISTVERSIONPREFIX=	v
DISTVERSION=	0.7.0.11
CATEGORIES=	math python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for the Flexible Collision Library
WWW=		https://github.com/berkeleyautomation/python-fcl

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libfcl.so:math/fcl \
		liboctomap.so:math/octomap
BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.26:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.26:math/py-numpy@${PY_FLAVOR}

USES=		compiler:c++11-lang eigen:3 python python-setuptools:78
USE_GITHUB=	yes
GH_ACCOUNT=	berkeleyautomation

USE_PYTHON=	autoplist concurrent cython pep517 pytest

TEST_ENV=	PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
TEST_WRKSRC=	${WRKSRC}/tests

post-install:
	${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/fcl/fcl*.so

.include <bsd.port.mk>
