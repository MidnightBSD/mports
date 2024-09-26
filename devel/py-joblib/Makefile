PORTNAME=	joblib
PORTVERSION=	1.3.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight pipelining using Python functions as jobs
WWW=		https://joblib.readthedocs.io/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}tomli>=0:textproc/py-tomli@${PY_FLAVOR}
TEST_DEPENDS=	${PYNUMPY}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}tomli>=0:textproc/py-tomli@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist
#pytest

NO_ARCH=	yes
NO_TEST=	yes

PYTEST_IGNORED_TESTS=	test_disk_used	\
			test_parallel_call_cached_function_defined_in_jupyter
PYTEST_BROKEN_TESTS=	test_memmapping_on_large_enough_dev_shm

.include <bsd.port.mk>
