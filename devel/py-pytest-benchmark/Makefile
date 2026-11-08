PORTNAME=	pytest-benchmark
PORTVERSION=	5.3.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pytest_benchmark-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	pytest fixture for benchmarking code
WWW=		https://github.com/ionelmc/pytest-benchmark

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}py-cpuinfo2>=10.1:sysutils/py-py-cpuinfo2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.1,1:devel/py-pytest@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}aspectlib>=0:devel/py-aspectlib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}elasticsearch>=0:textproc/py-elasticsearch@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}freezegun>=1.5.5:devel/py-freezegun@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}nbmake>=1.5.5:devel/py-nbmake@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygal>=3.1.0:graphics/py-pygal@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygaljs>=1.0.2:graphics/py-pygaljs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=0,1:devel/py-pytest-xdist@${PY_FLAVOR} \
		git:devel/git \
		hg:devel/mercurial

USES=		python:3.10+ python-setuptools:modern
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

OPTIONS_DEFINE=		ASPECT ELASTICSEARCH
ASPECT_DESC=		Aspect support
ELASTICSEARCH_DESC=	Elasticsearch support

ASPECT_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}aspectlib>=0:devel/py-aspectlib@${PY_FLAVOR}
ELASTICSEARCH_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}elasticsearch>=0:textproc/py-elasticsearch@${PY_FLAVOR}

do-test:
	cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest

.include <bsd.port.mk>
