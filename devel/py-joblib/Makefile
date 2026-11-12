PORTNAME=	joblib
PORTVERSION=	1.6.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight pipelining using Python functions as jobs
WWW=		https://joblib.readthedocs.io/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYNUMPY}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cloudpickle>=3.0:devel/py-cloudpickle@${PY_FLAVOR}

USES=		cpe python:3.11+ python-setuptools:78
CPE_VENDOR=	joblib_project
USE_PYTHON=	autoplist pep517
#pytest

NO_ARCH=	yes
NO_TEST=	yes

PYTEST_IGNORED_TESTS=	test_disk_used \
			test_parallel_call_cached_function_defined_in_jupyter
PYTEST_BROKEN_TESTS=	test_memmapping_on_large_enough_dev_shm

.include <bsd.port.mk>
