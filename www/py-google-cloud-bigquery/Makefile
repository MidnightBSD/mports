PORTNAME=	google-cloud-bigquery
DISTVERSION=	3.47.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/g}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Google BigQuery API client library
WWW=		https://github.com/googleapis/python-bigquery

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}google-api-core>=2.28.0:www/py-google-api-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-auth>=2.14.1:security/py-google-auth@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-cloud-core>=2.4.1:www/py-google-cloud-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-resumable-media>=2.0.0:www/py-google-resumable-media@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=24.2.0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-dateutil>=2.8.2:devel/py-python-dateutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.21.0:www/py-requests@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}google-cloud-testutils>0:www/py-google-cloud-testutils@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	pep517 autoplist pytest

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

NO_ARCH=	yes

TEST_WRKSRC=	${WRKSRC}/tests/unit
TEST_ARGS=	--disable-plugin-autoload

# FreeBSD reports 41 failed, 2722 passed, 113 skipped, all pandas/pyarrow integration failures.

.include <bsd.port.mk>
